class ArgumentIsNoString < ArgumentError
  def initialize(message = 'The argument must be a String.')
    super
  end
end

module Isogram
  def self.isogram?(input)
    raise ArgumentIsNoString unless input.is_a? String

    string = input.gsub(/[-\s]/, '')
    string ||= input
    string.downcase!
    string.length == string.chars.uniq.length
  end
end

p Isogram.isogram?(4) if $PROGRAM_NAME == __FILE__
