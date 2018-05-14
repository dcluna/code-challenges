<template>
<div class="chat-component">
  <div class="messages">
    <div class="message" v-for="message in messages">
      <p :class="message.type">{{ messageBody(message) }}</p>
    </div>
  </div>
  <input class="cmd" type="text" placeholder="Type here and press enter to send a message. Address someone with '<nickname>: <text>' to send a private message." @keyup.enter="sendMessage"/>
</div>
</template>

<script>
export default {
  props: ['messages', 'username'],
  methods: {
    sendMessage: function(e){
      console.log(e.target.value);
      this.messages.push({type: 'self', text: e.target.value});
      App.chat.speak(e.target.value);
      e.target.value = "";
    },
    messageBody: function(message){
      return ( message.source ? (message.source + ": ") : "" ) + message.text
    }
  }
}
</script>

<style scoped>
</style>
