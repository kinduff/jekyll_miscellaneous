# frozen_string_literal: true

require 'spec_helper'

describe JekyllMiscellaneous::Hooks::ExternalLinks do
  describe '#process' do
    let(:layout) { 'default' }
    let(:data) { { 'layout' => layout } }
    let(:config) { { 'base_url' => 'https://kinduff.com' } }
    let(:site) { double(:site, config: config) }
    let(:resource) { double(:resource, data: data, site: site, content: content) }
    let(:content) { '' }

    before do
      allow(resource).to receive(:output).and_return(content)
      allow(resource).to receive(:output=)
    end

    context 'when layout is nil' do
      let(:layout) { nil }

      it 'does nothing' do
        expect(resource).to_not receive(:output=)
        expect(described_class.process(resource)).to be_nil
      end
    end

    context 'when resource is an asset file' do
      before { allow(resource).to receive(:asset_file?).and_return(true) }

      it 'does nothing' do
        expect(resource).to_not receive(:output=)
        expect(described_class.process(resource)).to be_nil
      end
    end

    context 'when content has links' do
      context 'and href is a relative URL' do
        let(:content) { '<a href="/kinduff">kinduff.com</a>' }

        it 'does nothing' do
          output = described_class.process(resource)
          expect(output).to_not include('rel="external"')
          expect(output).to_not include('target="blank"')
          expect(output).to_not include('⧉')
        end
      end

      context 'and href is an absolute URL' do
        context 'and href does not match host' do
          let(:content) { '<a href="https://example.com">example.com</a>' }

          it 'adds rel="external" and target="_blank" to the link' do
            output = described_class.process(resource)
            expect(output).to include('rel="external"')
            expect(output).to include('target="_blank"')
            expect(output).to include('⧉')
          end

          context 'and content has an image' do
            let(:content) { '<a href="https://example.com"><img src="" /></a>' }

            it 'adds rel="external" and target="_blank" to the link' do
              output = described_class.process(resource)
              expect(output).to include('rel="external"')
              expect(output).to include('target="_blank"')
            end

            it 'does not add ⧉ to the image' do
              output = described_class.process(resource)
              expect(output).to_not include('⧉')
            end
          end

          context 'and link has a class of skip-external' do
            let(:content) { '<a href="https://example.com" class="skip-external">example.com</a>' }

            it 'adds rel="external" and target="_blank" to the link' do
              output = described_class.process(resource)
              expect(output).to include('rel="external"')
              expect(output).to include('target="_blank"')
            end

            it 'does not add ⧉ to the image' do
              output = described_class.process(resource)
              expect(output).to_not include('⧉')
            end
          end
        end

        context 'and href matches host' do
          let(:content) { '<a href="https://kinduff.com">kinduff.com</a>' }

          it 'does nothing' do
            output = described_class.process(resource)
            expect(output).to_not include('rel="external"')
            expect(output).to_not include('target="_blank"')
            expect(output).to_not include('⧉')
          end
        end
      end
    end
  end
end
