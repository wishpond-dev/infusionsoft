# encoding: utf-8
require File.expand_path('../lib/infusionsoft/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name          = 'infusionsoft'
  gem.version       = Infusionsoft::VERSION
  gem.authors       = ['Devin Turner']
  gem.email         = ['devin.turner09@gmail.com']
  gem.summary       = 'A simple ruby wrapper for the Infusionsoft API'
  gem.homepage      = 'https://github.com/l1h3r/infusionsoft'
  gem.license       = 'GPL'

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r( ^bin/ )).map { |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r( ^(test|spec|features)/ ))
  gem.require_paths = ['lib']

  gem.required_rubygems_version = Gem::Requirement.new('>= 1.3.6')

  gem.add_development_dependency 'bundler', '~> 1.5'
  gem.add_development_dependency 'rake',    '~> 10.3'
  gem.add_development_dependency 'rspec',   '~> 3.0'
end
