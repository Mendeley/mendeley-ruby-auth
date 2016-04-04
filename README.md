# Mendeley::Auth

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/mendeley/auth`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

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

