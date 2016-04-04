# Mendeley::Auth

Welcome to Mendeley:Auth! This gem will provide you with a simple library to help you in using the [Implicit Authorisation Flow](http://dev.mendeley.com/reference/topics/authorization_implicit.html) and the [Client Credentials Flow](http://dev.mendeley.com/reference/topics/authorization_client_credentials.html) to access the Mendeley API.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mendeley-auth'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mendeley-auth

## Usage

```ruby
config = {
  :client_id => ENV["CLIENT_ID"],
  :client_secret => ENV["CLIENT_SECRET"],
  :site => ENV["SITE"],
  :redirect_url => ENV["REDIRECT_URL"],
  :email => ENV["EMAIL"],
  :password => ENV["PASSWORD"]
}

auth = Mendeley::Auth.new(config)
auth.token.get("profiles/me")
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/mendeley-auth.
