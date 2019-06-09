module Isogram
  def self.isogram?(input)
    string = input.gsub(/[-\s]/, '')
    string ||= input
    string.downcase!
    string.length == string.chars.uniq.length
  end
end
