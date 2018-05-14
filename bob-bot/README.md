# Technical Spec

This is a two part test. The first part is to write a very simple chat bot with some very specific canned responses. The
second is to write a realtime chat application to interface with the chat bot. The required technologies here are Ruby, and VueJS. Outside of that you may use any gems or npm modules to assist in the completion.

### Ruby
This is a simple evaluation problem. You'll code Bob, a simple message responder as follows:

* Bob answers 'Sure.' if you ask him a question.
* He answers 'Woah, chill out!' if you yell at him (ALL CAPS).
* He says 'Fine. Be that way!' if you address him without actually saying anything.
* He answers 'Whatever.' to anything else.
* Write tests to asset the above is working correctly.

**NOTE:** Do not use "if", "unless" or "case" in your response code.

#### Results

Done as asked, with a full test suite.

### VueJS
This is a simple real time, browser based chat room to interface with Bob as follows:

* Public Lobby - Each user joining the lobby should be assigned a numbered username (e.g. User1234).
* Bob should be able to listen, and respond to both the public lobby, and his own private messages.
* Private Messages - Each user should be able to send/receive private messages.
* Write tests to assess the above is working correctly.

#### Results

Done as asked, but with a different UI: it replicates an IRC chatroom. This was done mostly to avoid Bob from spamming the public room whenever someone says something (all directed messages are private in this implementation).

There are unit tests for the Chatroom class (encapsulating the main logic for the chatroom), but I refrained from making system tests as they would be a little more time-consuming than expected for this exercise.
