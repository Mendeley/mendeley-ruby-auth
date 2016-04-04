require "oauth2"
require "mendeley/auth/version"

module Mendeley
  class Auth
    attr_reader :config, :grant_type

    def initialize(config)
      @config = config.reject { |_, v| v.nil? || (v.respond_to?(:empty) && v.empty?) }
      @email, @password = config.values_at(:email, :password)
    end

    def grant_type
      @grant_type ||= email && password ? :implicit : :client_credentials
    end

    def token
      @token ||= authenticate.tap do |t|
        max_redirects = config.fetch(:max_redirects, 0)
        t.client.options[:max_redirects] = max_redirects
      end
    end

    private

    attr_reader :email, :password

    def oauth_client
      @oauth_client ||= begin
        client_id = config.fetch(:client_id).to_s
        client_secret = config.fetch(:client_secret)
        site = config.fetch(:site)
        OAuth2::Client.new(client_id, client_secret, :site => site)
      end
    end

    def authenticate
      scope = config.fetch(:scope, "all")

      if grant_type == :implicit
        redirect_url = config.fetch(:redirect_url)
        authorize_url = oauth_client.implicit.authorize_url(:redirect_url => redirect_url, :scope => scope)
        res = request(authorize_url, "username" => email, "password" => password)
        location = res.headers["location"]
        query_string = URI.split(location).compact.find { |part| part.include?("access_token") }

        return OAuth2::AccessToken.from_kvform(oauth_client, query_string)
      end

      oauth_client.client_credentials.get_token(:scope => scope)
    end

    def request(url, params)
      http_client.post do |req|
        req.url url
        req.headers["Content-Type"] = "application/x-www-form-urlencoded"
        req.params.merge!(params)
      end
    end

    def http_client
      @http_client ||= Faraday.new(:url => oauth_client.site)
    end
 end
end
