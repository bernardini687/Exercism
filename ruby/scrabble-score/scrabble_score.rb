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

  def score
    @word.upcase.chars.map { |char| value_of(char) }.sum
  end

  def value_of(letter)
    value = RULES.select { |letters| letters.include?(letter) }
    value.empty? ? 0 : value.flatten[-1]
  end
end
