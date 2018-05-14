# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bob do
  subject(:bob) { described_class.new }

  describe '#answer' do
    subject { bob.answer(sentence) }

    context 'when you ask him a question' do
      let(:sentence) { 'You like potatoes?  ' }

      it { is_expected.to eq('Sure.') }
    end

    context 'when you yell at him' do
      let(:sentence) { 'HELLO MY FELLOW HUMAN' }

      it { is_expected.to eq('Woah, chill out!') }
    end

    context "when you don't say anything" do
      let(:sentence) { '      ' }

      it { is_expected.to eq('Fine. Be that way!') }
    end

    context 'when you say any other thing' do
      let(:sentence) { 'I like bananas.' }

      it { is_expected.to eq('Whatever.') }
    end
  end
end
