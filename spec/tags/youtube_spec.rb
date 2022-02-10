# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Tags::YouTubeTag do
  let(:output) { render_liquid(content) }
  let(:content) { '{% youtube dQw4w9WgXcQ %}' }

  context '#render' do
    it 'should render the tag' do
      parsed_output = Nokogiri::HTML(output)
      expect(parsed_output.search('div.youtube-container').count).to eq(1)
      expect(parsed_output.search('iframe').count).to eq(1)
      expect(parsed_output.search('iframe').first.attributes['src'].value).to eq(
        'https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ'
      )
    end
  end
end
