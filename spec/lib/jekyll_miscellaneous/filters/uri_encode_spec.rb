# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Filters::URIEncode do
  let(:output) { render_liquid(content) }
  let(:decoded) { 'foo' }
  let(:encoded) { 'candy' }

  describe '#base64_encode' do
    let(:content) { "{{ '#{decoded}' | uri_encode }}" }

    before { allow(URI).to receive(:encode_www_form_component).with(decoded) { encoded } }

    it { expect(output).to eq(encoded) }
  end
end
