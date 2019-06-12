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
  puts '%s is an isogram: %s' % [word = 'Bourne', Isogram.isogram?(word)]
  Isogram.isogram?(4)
end
