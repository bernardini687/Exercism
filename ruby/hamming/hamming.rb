module Hamming
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
