# Shanon Ruby Client [![Build Status](https://travis-ci.org/takuyan/shanon-ruby.svg?branch=master)](https://travis-ci.org/takuyan/shanon-ruby)

A Ruby client for the [Shanon Marketing Platform APIs](http://apidoc.shanon.co.jp/ja/api/).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'shanon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install shanon

## Usage

```ruby
Shanon.configure do |config|
  config.api_key = 'your_consumer_api_key'
  config.fqdn = 'your-consumer-name.smktg.jp'
  config.password = 'your_consumer_password'
  config.secret_key = 'your_consumer_secret_key'
end

client = Shanon::Clients::AuthenticationClient.new
puts client.get # => token

client = Shanon::Clients::VisitorClient.new
puts client.get # => visitors
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/takuyan/shanon-ruby. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Shanon project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/takuyan/shanon-ruby/blob/master/CODE_OF_CONDUCT.md).
