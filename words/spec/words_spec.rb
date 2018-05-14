# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Words do
  it 'has a version number' do
    expect(Words::VERSION).not_to be nil
  end

  describe Words::FourGrams do
    subject(:four_grams) { described_class.new(dictionary) }

    let(:dictionary) do
      <<~EOD
        arrows
        carrots
        give
        me
EOD
    end

    describe '#sequences' do
      subject { four_grams.sequences }

      it {
        is_expected.to eq(
          [
            'rrow',
            'rows',
            'carr',
            'rrot',
            'rots',
            'give'
          ]
        )
      }
    end

    describe '#words' do
      subject { four_grams.words }

      it {
        is_expected.to eq([
                            'arrows',
                            'arrows',
                            'carrots',
                            'carrots',
                            'carrots',
                            'give'
                          ])
      }
    end
  end
end
