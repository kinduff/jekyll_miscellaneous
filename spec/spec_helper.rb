# frozen_string_literal: true

require 'simplecov'
require 'simplecov-console'
require 'codecov'

SimpleCov::Formatter::Console.show_covered = true
SimpleCov.minimum_coverage(100)
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  SimpleCov::Formatter::Codecov
])
SimpleCov.start

require 'liquid'
require 'nokogiri'
require 'jekyll_miscellaneous'

RSpec.configure do |config|
  config.filter_run_when_matching :focus
  config.order = 'random'

  def render_liquid(content)
    template = Liquid::Template.parse(content)
    template.render
  end
end
