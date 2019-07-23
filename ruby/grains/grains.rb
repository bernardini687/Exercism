class OutOfRangeError < ArgumentError
  def initialize(message = 'Number given must be within 1 and 64.')
    super
  end
end

module Grains
  CHESSBOARD = 1..64

  class << self
    def total
      @total ||= grains.sum
    end

    def square(number)
      raise OutOfRangeError unless CHESSBOARD.cover?(number)

      2**(number - 1)
    end

    alias on_square square

    private

    def grains
      @grains ||= begin
        grains_on_squares = [1]
        63.times { grains_on_squares << grains_on_squares.last * 2 }
        grains_on_squares
      end
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts Grains.on_square(24)
  puts Grains.total
  # Calculate the number of grains on the given square number
  # (2..number).inject(1) { |memo, _| memo * 2 }
end
