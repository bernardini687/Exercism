class OutOfRangeError < ArgumentError
  def initialize(message = 'Number given must be within 1 and 64.')
    super
  end
end

module Grains
  CHESSBOARD = 1..64
  GRAINS = CHESSBOARD.each_with_object([]) do |cur, arr|
    arr << (arr.empty? ? cur : arr[-1] * 2)
  end
  TOTAL = GRAINS.sum

  class << self
    def square(number)
      raise OutOfRangeError unless CHESSBOARD.cover?(number)

      GRAINS[number - 1]
    end

    def total
      TOTAL
    end

    alias on_square square
  end
end

if $PROGRAM_NAME == __FILE__
  puts Grains.on_square(24)
  puts Grains.total
end
