# Todoable 

Takehome test for Teachable

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'todoable'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install todoable

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/dshiling/todoable.


## Notes

If not for ~2hr timebox I would have:
- finished the wrapper on the rest of the routes
- added more tests, used rspec/vcr, likely
- organized the gem/lib more conventionally overall, looked for more places to reuse code ie base classes
- likely not used faraday, chose mainly from familiarity - may have been more simple to just use NetHTTP or RestClient libs
