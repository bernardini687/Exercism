require 'pry'
module Hamming
  # def self.compute(str0, str1)
  #   if str0.length != str1.length
  #     raise ArgumentError, 'Should be of the same length'
  #   end

  #   str0.chars.zip(str1.chars).reduce(0) do |count, str|
  #     str[0] != str[1] ? count + 1 : count
  #   end
  # end
  def self.compute(strand1, strand2)
    unless strand1.length == strand2.length
      raise ArgumentError, 'Should be of the same length'
    end

    nucleotides = strand1.chars.zip(strand2.chars)
    nucleotides.count do |n1, n2|
      n1 != n2
    end
  end
end
