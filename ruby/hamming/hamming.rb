require 'pry'

module Hamming
  def self.compute(string1, string2)
    raise 'Should be of the same length' if string1.length != string2.length

    string1.chars.zip(string2.chars).reduce(0) do |acc, curr|
      curr[0] != curr[1] ? acc + 1 : acc
    end
  end
end
