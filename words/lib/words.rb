# frozen_string_literal: true

require 'words/version'

module Words
  class FourGrams
    def initialize(dictionary)
      @dictionary_words = dictionary.split("\n")
      @sequences        = []
      @words            = []
      unique_words_per_fourgram
    end

    attr_reader :sequences, :words

    private

    def unique_words_per_fourgram
      @dictionary_words.each_with_object({ }) do |dict_word, words_per_fourgram|
        next unless dict_word.length >= 4
        dict_word.chars.each_cons(4) do |fourgram_chars|
          fourgram = fourgram_chars.join
          if words_per_fourgram.key?(fourgram)
            words_per_fourgram.delete(fourgram)
          else
            words_per_fourgram[fourgram] = dict_word
          end
        end
      end.each do |fourgram, dict_word|
        @sequences << fourgram
        @words << dict_word
      end
    end
  end
end
