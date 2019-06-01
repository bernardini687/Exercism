module Raindrops
  SOUNDS = {
    3 => 'Pling',
    5 => 'Plang',
    7 => 'Plong'
  }.freeze

  class
    def self.convert(number)
      sound = ''
      sound << SOUNDS[3] if (number % 3).zero?
      sound << SOUNDS[5] if (number % 5).zero?
      sound << SOUNDS[7] if (number % 7).zero?
      sound.empty? ? number.to_s : sound
    end

    alias sound_of convert
  end
end

if $PROGRAM_NAME == __FILE__
  p Raindrops.sound_of(28)
  p Raindrops.sound_of(35)
  p Raindrops.sound_of(42)
end
