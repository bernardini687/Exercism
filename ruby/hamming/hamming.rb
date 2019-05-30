module Hamming
  def self.compute(str0, str1)
    if str0.length != str1.length
      raise ArgumentError, 'Should be of the same length'
    end

    str0.chars.zip(str1.chars).reduce(0) do |count, str|
      str[0] != str[1] ? count + 1 : count
    end
  end
end
