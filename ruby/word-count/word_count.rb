class Phrase
  attr_reader :phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    words = Hash.new(0)
    regex = /([a-zA-Z]+'[a-zA-Z]|[a-zA-Z\d]+\b)/
    phrase.scan(regex).flatten.each do |word|
      words[word.downcase] += 1
    end
    words
  end
end
