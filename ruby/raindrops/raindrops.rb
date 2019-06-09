module Divisible
  refine Integer do
    def divisible_by?(number)
      (self % number).zero?
    end
    alias :factor? :divisible_by?
  end
end

class Raindrops
  using Divisible

  def self.convert(number)
    new(number).to_s
  end

  def initialize(number)
    @number = number
  end

  def to_s
    sound = define_sound
    sound.empty? ? @number.to_s : sound
  end

  private

  def define_sound(sound = '')
    sound << 'Pling' if @number.factor? 3
    sound << 'Plang' if @number.factor? 5
    sound << 'Plong' if @number.factor? 7
    sound
  end
end

puts Raindrops.new(21) if $PROGRAM_NAME == __FILE__
