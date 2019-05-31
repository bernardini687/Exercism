class StrandLengthError < ArgumentError
  def message
    'Strand lengths must be identical.'
  end
end

module Hamming
  def self.compute(strand1, strand2)
    raise StrandLengthError unless strand1.length == strand2.length

    nucleotides = strand1.chars.zip(strand2.chars)
    nucleotides.count { |n1, n2| n1 != n2 }
  end
end
