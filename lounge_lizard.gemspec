# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'lounge_lizard/version'

Gem::Specification.new do |spec|
  spec.name          = 'lounge_lizard'
  spec.version       = LoungeLizard::VERSION
  spec.authors       = ['David Garcia']
  spec.email         = ['david.garcia@moviepilot.com']

  spec.summary       = 'Ruby binding for mson parsing with apiaryio/drafter'
  spec.description   = 'Ruby binding for mson parsing with apiaryio/drafter'
  spec.homepage      = 'https://github.com/moviepilot/lounge_lizard'
  spec.license       = 'MIT'


  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'ffi'

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'guard'
  spec.add_development_dependency 'guard-bundler'
  spec.add_development_dependency 'guard-rspec'
  spec.add_development_dependency 'guard-ctags-bundler'
  spec.add_development_dependency 'byebug'
end
