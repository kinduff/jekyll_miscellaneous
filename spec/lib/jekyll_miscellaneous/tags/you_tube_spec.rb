# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Tags::YouTube do
  let(:output) { render_liquid(content) }
  let(:parsed_output) { Nokogiri::HTML(output) }

  describe '#render' do
    context 'with default option' do
      let(:content) { '{% youtube dQw4w9WgXcQ %}' }

      it 'renders a container' do
        expect(parsed_output.search('div.youtube-container').count).to eq(1)
      end

      it 'renders an iframe' do
        expect(parsed_output.search('iframe').count).to eq(1)
      end

      it 'renders the iframe with the correct src' do
        expect(parsed_output.search('iframe').first.attributes['src'].value).to eq(
          'https://www.youtube.com/embed/dQw4w9WgXcQ'
        )
      end
    end

    context 'with nocookie option' do
      let(:content) { '{% youtube dQw4w9WgXcQ nocookie %}' }

      it 'renders a container' do
        expect(parsed_output.search('div.youtube-container').count).to eq(1)
      end

      it 'renders an iframe' do
        expect(parsed_output.search('iframe').count).to eq(1)
      end

      it 'renders the iframe with the correct src' do
        expect(parsed_output.search('iframe').first.attributes['src'].value).to eq(
          'https://www.youtube-nocookie.com/embed/dQw4w9WgXcQ'
        )
      end
    end

    context 'with normal option' do
      let(:content) { '{% youtube dQw4w9WgXcQ normal %}' }

      it 'renders a container' do
        expect(parsed_output.search('div.youtube-container').count).to eq(1)
      end

      it 'renders an iframe' do
        expect(parsed_output.search('iframe').count).to eq(1)
      end

      it 'renders the iframe with the correct src' do
        expect(parsed_output.search('iframe').first.attributes['src'].value).to eq(
          'https://www.youtube.com/embed/dQw4w9WgXcQ'
        )
      end
    end
  end
end
