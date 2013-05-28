# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'acts_as_statable/version'

Gem::Specification.new do |spec|
  spec.name          = "acts_as_statable"
  spec.version       = ActsAsStatable::VERSION
  spec.authors       = ["Ghislain de Juvigny"]
  spec.email         = ["gdjuvigny@gmail.com"]
  spec.description   = %q{Stats on a Mongoid::Document Model}
  spec.summary       = %q{Stats on a Mongoid::Document Model }
  spec.homepage      = "http://about.me/ghislaindj"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"

  gem.add_dependency 'chartkick', '> 1.0.0'
end
