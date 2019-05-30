class Phrase
  WORDS = /\b[\w']+\b/
  attr_reader :phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    phrase.scan(WORDS).each_with_object(Hash.new(0)) do |word, memo|
      memo[word.downcase] += 1
    end
  end
end
