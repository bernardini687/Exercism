require 'pry'
module Grains
  GRAINS = (1..64).to_a.each_with_object([]) do |cur, memo|
    val = memo.empty? ? cur : memo[-1] * 2
    memo << val
  end

  binding.pry

  def self.square(number)
    GRAINS[number]
  end
end

p Grains.square(64) if $PROGRAM_NAME == __FILE__
