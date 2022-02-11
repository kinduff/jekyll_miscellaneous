# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Hooks::Mark do
  let(:doc) { double(:doc, content: content )}
  let(:content) { 'foo ==hello== bar ==candy=='.dup }

  describe '#process' do
    before { described_class.process(doc) }

    it { expect(doc.content).to eq('foo <mark>hello</mark> bar <mark>candy</mark>') }
  end
end
