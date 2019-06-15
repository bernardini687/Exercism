class Scrabble
  RULES = [
    ['A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T', 1],
    ['D', 'G', 2],
    ['B', 'C', 'M', 'P', 3],
    ['F', 'H', 'V', 'W', 'Y', 4],
    ['K', 5],
    ['J', 'X', 8],
    ['Q', 'Z', 10]
  ].freeze

  def initialize(word)
    @word = word || ''
  end

  def self.score(word)
    new(word).score
  end

  def letters
    @word.upcase.chars
  end

  def score
    letters.map { |letter| score_of(letter) }.sum
  end

  private

  def score_of(letter)
    score = RULES.find { |letters| letters.include?(letter) }
    score.nil? ? 0 : score[-1]
  end
end
