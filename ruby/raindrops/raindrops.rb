require 'pry'
module Raindrops
  FACTORS_TO_SOUND = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  class << self
    def sound_or_blank(number, factor)
      (number % factor).zero? ? FACTORS_TO_SOUND[factor] : ''
    end

    def convert(number)
      sound = ''
      sound << sound_or_blank(number, 3)
      sound << sound_or_blank(number, 5)
      sound << sound_or_blank(number, 7)
      sound.empty? ? number.to_s : sound
    end

    alias sound_of convert
  end
end

if $PROGRAM_NAME == __FILE__
  p Raindrops.sound_of(21)
  p Raindrops.sound_of(9)
  p Raindrops.sound_of(105)
  p Raindrops.sound_of(3)
end
