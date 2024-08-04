# InitializeWith

![ci](https://github.com/rangerscience/initialize_with/actions/workflows/ci.yml/badge.svg)

Utility gem to ease Ruby code development by replacing the common boiler plate:

```ruby
class MyClass
  def initialize param
    @param = param
  end
end
```

with

```ruby
class MyClass
  include InitializeWith
  initialize_with :param
end
```

## Installation

```gemfile
gem 'initialize_with'
```
```ruby
require "initialize_with"
```

## Usage
The aim is function "as you expect", and otherwise, see the rspec tests for more involved examples.

If you were writing:
```ruby
class MyClass
  def initialize foo, bar: 42
    @foo = foo
    @bar = bar
    call_some_function
  end
end
```

you can now write:
```ruby
class MyClass
  include InitializeWith
  initialize_with :foo, bar: 42 do
    call_some_function
  end
end
```

Additionally, it's safe to invoke multiple times:
```ruby
class MyClass
  include InitializeWith
  initialize_with :foo
  initialize_with bar: 42
end
```

### Inheritance
Simple inheritance works just fine:

```ruby
class Parent
  include InitializeWith
end

class MyClass
  initialize_with :foo, bar: 42
end
```

But note that there isn't a way to replicate something like `super` - you'll have to do things by hand (see the test suite for more).

## Development

`bundle install` to get started, `rspec` for tests, `bin/console` for an IRB that's already `reqiured` the library.

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/rangerscience/initialize_with. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the InitializeWith project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/rangerscience/initialize_with/blob/master/CODE_OF_CONDUCT.md).
