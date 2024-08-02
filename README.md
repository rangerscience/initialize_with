# InitializeWith

Utility gem to ease Ruby code development by replacing the common boiler plate:

```ruby
def initialize param, keyword:
  @param = param
  @keyword = keyword
end
```

with

```
class MyClass
  include InitializeWith

  initialize_with :param
  initialize_with_kwargs :keyword

## Installation

```ruby
gem 'initialize_with'
```

## Usage

```


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rangerscience/initialize_with. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InitializeWith project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rangerscience/initialize_with/blob/master/CODE_OF_CONDUCT.md).
