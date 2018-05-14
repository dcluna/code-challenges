/* eslint no-console: 0 */
import TurbolinksAdapter from 'vue-turbolinks';
import Vue from 'vue/dist/vue.esm';
import Chatroom from '../chatroom.vue';

Vue.use(TurbolinksAdapter);

Vue.component('chatroom', Chatroom);

document.addEventListener('turbolinks:load', () => {
  App.chatroom = new Vue({
    el: '#chatroom',
    data: {
      messages: [
        {text: 'This is an example of a public message', type: 'public'},
        {text: 'This is an example of an admin message', type: 'admin'},
        {text: '<SenderUsername>: This is an example of a private message', type: 'private'},
        {text: 'This is how your own messages will appear', type: 'self'}
      ],
      username: 'Anonymous'
    },
    methods: {
      received: function(data) {
        if(data.username){
          this.username = data.username;
        }
        if(data.message) {
          this.messages.push(data.message);
        }
      }
    }
  });
  App.connectChat();
});
