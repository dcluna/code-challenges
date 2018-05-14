# frozen_string_literal: true

class Chatroom
  def initialize(channel_class)
    @channel_class = channel_class
    @users         = { }
    @bob           = Bob.new
  end

  def user_list
    @users.values.map(&:name) + ['BobBot']
  end

  def new_user(connection)
    @users[connection] = User.new(user_list)
  end

  def subscribed(connection)
    user = @users[connection]
    message(to: user.name, username: user.name, message: { text: "Your username is #{user.name}", type: 'admin' })
    message(message: { text: "#{user.name} joined", type: 'admin' })
  end

  def unsubscribed(connection)
    user = @users.delete connection
    message(message: { text: "#{user.name} left", type: 'admin' })
  end

  def send_user_list(connection)
    user = @users[connection]
    message(to: user.name, message: { text: "Connected users: #{user_list.join(', ')}", type: 'admin' })
  end

  def message(**attrs)
    if to = attrs.delete(:to)
      @channel_class.broadcast_to private_channel(to), { type: 'private' }.merge(attrs)
    else
      @channel_class.broadcast_to public_channel, attrs
    end
  end

  def on_chat(data, connection)
    user          = @users[connection]
    message       = data['message']
    if match      = message.strip.match(/\A(?<username>[^:]+): *(?<privmsg>.*)\z/)
      destination = match['username']
      if destination == 'BobBot'
        message(to: user.name, message: { text: @bob.answer(match['privmsg']), type: 'private', source: 'BobBot' })
      else
        message(to: destination, message: { text: match['privmsg'], type: 'private', source: user.name })
      end
    else
      message message: { text: message, type: 'public', source: user.name }
    end
  end

  private

  def public_channel
    'public'
  end

  def private_channel(username)
    username.to_s
  end

  class User
    attr_reader :name
    def initialize(usernames)
      loop do
        @name = "User#{Random.rand(10_000)}"
        break unless usernames.include?(@name)
      end
    end
  end
end
