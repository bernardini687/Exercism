module Isogram
  def self.isogram?(string)
    unless string.is_a? String
      raise ArgumentError, 'The argument must be a String.'
    end

    letters = string.downcase.scan(/\w/)
    letters.length == letters.uniq.length
  end
end

if $PROGRAM_NAME == __FILE__
  puts Isogram.isogram?('Bourne')
  puts Isogram.isogram?(4)
end
