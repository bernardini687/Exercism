class Phrase
  attr_reader :phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = Hash.new(0)
    phrase.split.each do |word|
      words[word] += 1
    end
    words
  end
end
