require "spec_helper"

RSpec.describe Mendeley::Auth do
  subject(:auth) { described_class.new(config) }
  let(:config) { {
    :client_id => client_id,
    :client_secret => client_secret,
    :site => site,
    :redirect_url => redirect_url,
    :email => email,
    :password => password
  } }
  let(:client_id) { ENV["MENDELEY_API_CLIENT_ID"] }
  let(:client_secret) { ENV["MENDELEY_API_CLIENT_SECRET"] }
  let(:site) { "https://api.mendeley.com" }
  let(:redirect_url) { "http://localhost:9292/oauth2/callback" }
  let(:email) { }
  let(:password) { }

  describe "#initialize" do
    it "filters empty settings and assigns the rest" do
      expect(auth.config).to eq(
        :client_id => client_id,
        :client_secret => client_secret,
        :site => site,
        :redirect_url => redirect_url)
    end
  end

  describe "#grant_type" do
    context "without username and password (grant type: client credentials)" do
      it "returns :client_credentials" do
        expect(auth.grant_type).to eq(:client_credentials)
      end
    end

    context "with username and password" do
      let(:email) { ENV["MENDELEY_API_USERNAME"] }
      let(:password) { ENV["MENDELEY_API_PASSWORD"] }

      it "returns :implicit" do
        expect(auth.grant_type).to eq(:implicit)
      end
    end
  end

  describe "#token / #grant_type" do
    context "without username and password" do
      it "returns a 'client credentials' token" do
        expect(auth.token).to_not be_nil
        expect { auth.token.get("/profiles/me") }.to raise_error(OAuth2::Error, /No userid/)
      end
    end

    context "with username and password" do
      let(:email) { ENV["MENDELEY_API_USERNAME"] }
      let(:password) { ENV["MENDELEY_API_PASSWORD"] }

      it "returns an 'implicit' token" do
        expect(auth.token).to_not be_nil
        expect(auth.token.get("/profiles/me").status).to eq(200)
      end
    end
  end
end
