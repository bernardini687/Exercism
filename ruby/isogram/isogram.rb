module Isogram
  def self.isogram?(input)
    unless input.is_a? String
      raise ArgumentError, 'The argument must be a String.'
    end

    string = input.downcase.scan(/\w/)
    string.length == string.uniq.length
  end
end

if $PROGRAM_NAME == __FILE__
  p Isogram.isogram?('Bourne')
  p Isogram.isogram?(4)
end
