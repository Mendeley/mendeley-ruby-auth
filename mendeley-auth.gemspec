# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mendeley/auth/version'

Gem::Specification.new do |spec|
  spec.name          = "mendeley-auth"
  spec.license       = "Apache"
  spec.version       = Mendeley::Auth::VERSION
  spec.authors       = ["Mendeley Ltd."]
  spec.email         = ["tools@mendeley.com"]

  spec.summary       = "Mendeley OAuth2 authentication and authorization"
  spec.description   = "A simple library to obtain client credentials or implicit oauth tokens to access the Mendeley API"
  spec.homepage      = "https://github.com/mendeley-ruby-auth"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_runtime_dependency "faraday", "~> 0.9"
  spec.add_runtime_dependency "oauth2", "~> 1.0"
end
