class OutOfRangeError < ArgumentError
  def initialize(message = 'Number given must be within 1 and 64.')
    super
  end
end

module Grains
  CHESSBOARD = 1..64
  GRAINS = CHESSBOARD.to_a.each_with_object([]) do |cur, arr|
    arr << (arr.empty? ? cur : arr[-1] * 2)
  end

  class << self
    def square(number)
      raise OutOfRangeError unless CHESSBOARD.cover?(number)

      GRAINS[number - 1]
    end

    alias on_square square
  end
end

puts Grains.on_square(24) if $PROGRAM_NAME == __FILE__
