require 'pry'

class Phrase
  WORD = /\b[\w']+\b/.freeze
  attr_reader :phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = Hash.new(0)
    phrase.scan(regex).flatten.each do |word|
      words[word.downcase] += 1
    end
    words
  end
end
