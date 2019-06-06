module Raindrops
  refine Integer do
    def divisible_by?(number)
      (self % number).zero?
    end
  end

  using self

  class << self
    def convert(number)
      sound = ''
      sound << 'Pling' if number.divisible_by? 3
      sound << 'Plang' if number.divisible_by? 5
      sound << 'Plong' if number.divisible_by? 7
      sound.empty? ? number.to_s : sound
    end
  end
  # alias sound_of convert
end

puts Raindrops.convert(21) if $PROGRAM_NAME == __FILE__
