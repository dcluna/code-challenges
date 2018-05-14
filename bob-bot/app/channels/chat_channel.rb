# frozen_string_literal: true

class ChatChannel < ApplicationCable::Channel
  def subscribed
    @@chatroom ||= Chatroom.new(self.class)
    stream_from 'chat:public'
    user = @@chatroom.new_user(@connection)
    stream_from "chat:#{user.name}"
  end

  def unsubscribed
    @@chatroom.unsubscribed(@connection)
  end

  def speak(data)
    @@chatroom.on_chat(data, @connection)
  end

  def request_username
    @@chatroom.subscribed(@connection)
    @@chatroom.send_user_list(@connection)
  end
end
