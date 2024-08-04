
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "initialize_with/version"

Gem::Specification.new do |spec|
  spec.name          = "initialize_with"
  spec.version       = InitializeWith::VERSION
  spec.authors       = [ "Nicholas Barone" ]
  spec.email         = [ "nicktbarone@gmail.com" ]

  spec.summary       = %q(Sugar to skip the usual @param = param boilerplate in Ruby)
  spec.description   = %q(Adds some utility class methods to simplify some common Ruby patterns)
  spec.homepage      = "https://github.com/rangerscience/initialize_with"
  spec.license       = "MIT"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = [ "lib" ]

  spec.required_ruby_version = '>= 3.0.0'

  spec.add_development_dependency "bundler", "~> 2.5"
  spec.add_development_dependency "rake", "~> 13.2"
  spec.add_development_dependency "rspec", "~> 3.13"
  spec.add_development_dependency "debug", "~> 1.6"
  spec.add_development_dependency "rubocop", "~> 1.6"
  spec.add_development_dependency "rubocop-rails-omakase", "~> 1.0"
end
