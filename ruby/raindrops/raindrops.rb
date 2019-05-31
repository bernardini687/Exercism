module Raindrops
  def self.convert(number, output = '')
    output += 'Pling' if (number % 3).zero?
    output += 'Plang' if (number % 5).zero?
    output += 'Plong' if (number % 7).zero?
    output == '' ? number.to_s : output
  end
end
