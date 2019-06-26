class OutOfRangeError < ArgumentError
  def initialize(message = 'Number given must be within 1 and 64.')
    super
  end
end

module Grains
  CHESSBOARD = 1..64

  class << self
    def grains
      @grains ||= begin
        (2..64).each_with_object([1]) do |_, arr|
          arr << arr[-1] * 2
        end
      end
    end

    def total
      @total ||= grains.sum
    end

    def square(number)
      raise OutOfRangeError unless CHESSBOARD.cover?(number)

      grains[number - 1]
    end

    alias on_square square
  end
end

if $PROGRAM_NAME == __FILE__
  puts Grains.on_square(24)
  puts Grains.total
  # Calculate the number of grains on the given square number
  # (2..number).inject(1) { |memo, _| memo * 2 }
end
