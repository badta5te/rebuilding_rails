# frozen_string_literal: true

require_relative "lib/rulers/version"

Gem::Specification.new do |spec|
  spec.name = "rulers"
  spec.version = Rulers::VERSION
  spec.authors = ["Pavel Mikhaylov"]
  spec.email = ["mikhailov.sztu@gmail.com"]

  spec.summary = "My walkthrough of the book"
  spec.description = "Some long description"
  spec.homepage = "https://github.com/badta5te/rebuilding_rails"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/badta5te/rebuilding_rails"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html

  spec.add_runtime_dependency "erubis", "~> 2.7.0"
  spec.add_runtime_dependency "multi_json", "~> 1.15.0"
  spec.add_runtime_dependency "rack", "~> 2.2.3"
  spec.add_development_dependency "minitest", "~> 5.15.0"
  spec.add_development_dependency "rack-test", "~> 1.1.0"
  spec.add_development_dependency "sqlite3", "~> 1.4.2"
end
