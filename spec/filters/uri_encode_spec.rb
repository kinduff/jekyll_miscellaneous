require 'spec_helper'

describe JekyllMiscellaneous::Filters::URIEncodeFilter do
  let(:output) { render_liquid(content) }
  let(:decoded) { 'foo' }
  let(:encoded) { 'candy' }

  context "#base64_encode" do
    let(:content)  { "{{ '#{decoded}' | uri_encode }}" }

    before { allow(URI).to receive(:encode_www_form_component).with(decoded) { encoded } }

    it { expect(output).to eq(encoded) }
  end
end
