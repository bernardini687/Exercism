class InvalidArgument < ArgumentError
  def initialize(message = 'The argument must be a String.')
    super
  end
end

module Isogram
  def self.isogram?(input)
    raise InvalidArgument unless input.is_a? String

    string = input.gsub(/[-\s]/, '')
    string ||= input
    string.downcase!
    string.length == string.chars.uniq.length
  end
end

if $PROGRAM_NAME == __FILE__
  p Isogram.isogram?('Bourne')
  p Isogram.isogram?(4)
end
