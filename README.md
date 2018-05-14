# Coding Challenges

## Words

Technical Spec
----------------

Write a program which, given a dictionary, generates two output files, 'sequences' and 'words'. Sequences should contain every sequence of four letters that appears in exactly one word of the dictionary, one sequence per line. Words should contain the corresponding words that contain the sequences, in the same order, again one per line.

For example, given the trivial dictionary containing only the following words:

```
arrows
carrots
give
me
```

The expected output would be:

sequences
```
carr
rrot
rots
rows
rrow
give
```

words
```
carrots
carrots
carrots
arrows
arrows
give
```

In the above example, 'arro' does not appear in the output. This is because it is found in more than one word (cARROts, ARROw).

## Bob the bot

Technical Spec
----------------

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

### VueJS
This is a simple real time, browser based chat room to interface with Bob as follows:

* Public Lobby - Each user joining the lobby should be assigned a numbered username (e.g. User1234).
* Bob should be able to listen, and respond to both the public lobby, and his own private messages.
* Private Messages - Each user should be able to send/receive private messages.
* Write tests to assess the above is working correctly.
