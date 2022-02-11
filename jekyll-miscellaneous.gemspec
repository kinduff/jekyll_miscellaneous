# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll-miscellaneous/version'
Gem::Specification.new do |spec|
  spec.name          = 'jekyll-miscellaneous'
  spec.summary       = 'Collection of custom plugins I use on Jekyll sites'
  spec.description   = 'Collection of custom plugins I use on Jekyll sites.'
  spec.version       = JekyllMiscellaneous::VERSION
  spec.authors       = ['Alejandro AR']
  spec.email         = ['kinduff@protonmail.com']
  spec.homepage      = 'https://github.com/kinduff/jekyll-miscellaneous'
  spec.licenses      = ['MIT']
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']
  spec.add_dependency 'jekyll', '~> 3.0'
  spec.add_dependency 'nokogiri', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 11.0'
  spec.add_development_dependency 'rspec', '~> 3.5'
  spec.add_development_dependency 'rubocop', '~> 0.52'
  spec.add_development_dependency 'simplecov', '~> 0.21'
  spec.add_development_dependency 'simplecov-console', '~> 0.9.1'
end
