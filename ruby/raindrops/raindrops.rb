module Raindrops
  refine Integer do
    def divisible_by?(number)
      (self % number).zero?
    end
  end

  using self

  def self.convert(number)
    new(number).to_s
  end

  def self.new(number)
    sound = ''
    sound << 'Pling' if number.divisible_by? 3
    sound << 'Plang' if number.divisible_by? 5
    sound << 'Plong' if number.divisible_by? 7
    sound.empty? ? number : sound
  end
end

puts Raindrops.new(21) if $PROGRAM_NAME == __FILE__
