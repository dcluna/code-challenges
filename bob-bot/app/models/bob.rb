# frozen_string_literal: true

class Bob
  RULES = [
    [/\?\s*\z/, 'Sure.'],
    [/\A\s*\z/, 'Fine. Be that way!'],
    [/\A[^a-z]+\z/, 'Woah, chill out!'],
    [/\A.*\z/, 'Whatever.']
  ].freeze

  def answer(sentence)
    RULES.find { |(matcher, _)| matcher.match(sentence) }.last
  end
end
