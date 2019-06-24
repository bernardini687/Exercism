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
        CHESSBOARD.each_with_object([]) do |cur, arr|
          arr << (arr.empty? ? cur : arr[-1] * 2)
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
end
