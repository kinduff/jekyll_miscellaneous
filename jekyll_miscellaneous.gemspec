# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll_miscellaneous/version'
Gem::Specification.new do |spec|
  spec.name          = 'jekyll_miscellaneous'
  spec.summary       = 'A collection of opinionated plugins for Jekyll.'
  spec.description   = 'A collection of opinionated plugins for Jekyll.'
  spec.version       = JekyllMiscellaneous::VERSION
  spec.authors       = ['Alejandro AR']
  spec.email         = ['kinduff@protonmail.com']
  spec.homepage      = 'https://github.com/kinduff/jekyll_miscellaneous'
  spec.licenses      = ['MIT']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.5'
  spec.add_dependency 'jekyll', '~> 3.0'
  spec.add_dependency 'nokogiri', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 1.25'
  spec.add_development_dependency 'rubocop-performance', '~> 1.13'
  spec.add_development_dependency 'rubocop-rspec', '~> 2.8'
  spec.add_development_dependency 'simplecov', '~> 0.21'
  spec.add_development_dependency 'simplecov-console', '~> 0.9.1'
  spec.metadata['rubygems_mfa_required'] = 'true'
end
