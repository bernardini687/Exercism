class StrandLengthError < ArgumentError
  def initialize(message = 'Strand lengths must be identical.')
    super
  end
end

module Hamming
  class << self
    def compute(strand1, strand2)
      raise StrandLengthError unless strand1.length == strand2.length

      nucleotides = strand1.chars.zip(strand2.chars)
      nucleotides.count { |n1, n2| n1 != n2 }
    end

    alias difference compute
  end
end
