# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Filters::Base64 do
  let(:output) { render_liquid(content) }
  let(:decoded) { 'foo' }
  let(:encoded) { 'candy' }

  context '#base64_encode' do
    let(:content) { "{{ '#{decoded}' | base64_encode }}" }

    before { allow(Base64).to receive(:encode64).with(decoded) { encoded } }

    it { expect(output).to eq(encoded) }
  end

  context '#base64_decode' do
    let(:content) { "{{ '#{encoded}' | base64_decode }}" }

    before { allow(Base64).to receive(:decode64).with(encoded) { decoded } }

    it { expect(output).to eq(decoded) }
  end
end
