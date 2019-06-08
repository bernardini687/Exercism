class OutOfRangeError < ArgumentError
  def initialize(message = 'Number given must be within 1 and 64.')
    super
  end
end

module Grains
  GRAINS = (1..64).to_a.each_with_object([]) do |cur, arr|
    arr << (arr.empty? ? cur : arr[-1] * 2)
  end

  def self.square(number)
    GRAINS[number - 1]
  end
end

puts Grains.square(64) if $PROGRAM_NAME == __FILE__
