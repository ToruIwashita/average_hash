# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'average_hash/version'

Gem::Specification.new do |spec|
  spec.name          = "average_hash"
  spec.version       = AverageHash::VERSION
  spec.authors       = ["ToruIwashita"]
  spec.email         = ["toru.iwashita@gmail.com"]
  spec.description   = %q{Simple similarity calculation method of image}
  spec.summary       = %q{Simple similarity calculation method of image}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rmagick"
end
