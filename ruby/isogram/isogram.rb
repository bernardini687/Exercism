module Isogram
  def self.isogram?(phrase)
    unless phrase.is_a? String
      raise ArgumentError, 'The argument must be a word or a phrase.'
    end

    letters = phrase.downcase.scan(/[[:lower:]]/)
    letters.length == letters.uniq.length
  end
end

if $PROGRAM_NAME == __FILE__
  puts Isogram.isogram?('Bourne')
  puts Isogram.isogram?(4)
end
