App.connectChat = ->
  App.chat = App.cable.subscriptions.create "ChatChannel",
    connected: ->
      console.log 'connected'
      @perform('request_username')

    disconnected: ->
      console.log 'disconnected'
      # Called when the subscription has been terminated by the server

    received: (data) ->
      console.log(data)
      App.chatroom.received(data)

    speak: (message) ->
      console.log "message = #{message}"
      @perform('speak', message: message)
