# frozen_string_literal: true

require 'liquid'
require 'nokogiri'
require 'jekyll-miscellaneous'

RSpec.configure do |config|
  config.filter_run_when_matching :focus
  config.order = 'random'

  def render_liquid(content)
    template = Liquid::Template.parse(content)
    template.render
  end
end
