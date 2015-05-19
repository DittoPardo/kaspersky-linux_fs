# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kaspersky/linux_fs/version'

Gem::Specification.new do |spec|
  spec.name          = "kaspersky-linux_fs"
  spec.version       = Kaspersky::LinuxFs::VERSION
  spec.authors       = ["LightSuner"]
  spec.email         = ["lightsuner@gmail.com"]
  spec.summary       = %q{Small wrapper for Kaspersky linux file system}
  #spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = "https://github.com/ikantam/kaspersky-linux_fs"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  #spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.0'
  spec.required_rubygems_version = '~> 1.8'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
