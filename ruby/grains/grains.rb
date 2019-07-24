class OutOfRangeError < ArgumentError
  def initialize(message = 'Given number must fall within 1 and 64.')
    super
  end
end

module Grains
  CHESSBOARD = 1..64

  class << self
    def total
      2**CHESSBOARD.last - 1
    end

    def square(number)
      raise OutOfRangeError unless CHESSBOARD.cover?(number)

      2**(number - 1)
    end

    alias on_square square
  end
end

if $PROGRAM_NAME == __FILE__
  puts Grains.on_square(24)
  puts Grains.total
end
