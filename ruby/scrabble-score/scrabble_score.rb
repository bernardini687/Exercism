class Scrabble
  RULES = {
    %w[A E I O U L N R S T] => 1,
    %w[D G] => 2,
    %w[B C M P] => 3,
    %w[F H V W Y] => 4,
    %w[K] => 5,
    %w[J X] => 8,
    %w[Q Z] => 10
  }.freeze

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
    score = RULES.find { |letters, _value| letters.include?(letter) }
    score.last || 0
  end
end

puts Scrabble.score('cabbage') if $PROGRAM_NAME == __FILE__
