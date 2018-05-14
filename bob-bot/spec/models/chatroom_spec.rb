# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Chatroom do
  subject(:chatroom) { described_class.new(mock_chat_channel) }

  let(:mock_chat_channel) { double('ChatChannel') }

  describe '#new_user' do
    subject { chatroom.new_user('id') }

    it 'creates a new user' do
      expect { subject }.to change { chatroom.user_list.count }.by(1)
    end
  end

  describe '#unsubscribed' do
    subject { chatroom.unsubscribed('id') }

    before do
      allow(chatroom).to receive(:message).once
      chatroom.new_user('id')
    end

    it 'deletes the user created with this identifier' do
      expect { subject }.to change { chatroom.user_list.count }.by(-1)
    end
  end

  describe '#message' do
    subject(:message) { chatroom.message(attrs) }

    context 'when message has a :to' do
      let(:attrs) { { to: 'someone', message: 'msg' } }

      it 'sends a private message to the user' do
        expect(mock_chat_channel).to receive(:broadcast_to).with('someone', attrs.slice(:message).merge(type: 'private'))
        message
      end
    end

    context 'when message has no :to field' do
      let(:attrs) { { message: 'msg' } }

      it 'sends a message to the public channel' do
        expect(mock_chat_channel).to receive(:broadcast_to).with('public', attrs.slice(:message))
        message
      end
    end
  end

  describe '#on_chat' do
    subject { chatroom.on_chat(data, connection) }

    let(:connection) { 'some_id' }
    let!(:user) { chatroom.new_user(connection) }
    let(:data) { { 'message' => message } }

    context 'when we receive a public message' do
      let(:message) { 'something something' }

      it 'sends a message to the public channel' do
        expect(chatroom).to receive(:message).with(message: { text: message, type: 'public', source: user.name })
        subject
      end
    end

    context 'when we receive a directed message to the bot' do
      let(:message) { 'BobBot: HOWDY' }

      it 'sends a private message to the respective user' do
        expect(chatroom).to receive(:message).with(to: user.name, message: { text: 'Woah, chill out!', type: 'private', source: 'BobBot' })
        subject
      end
    end
  end
end
