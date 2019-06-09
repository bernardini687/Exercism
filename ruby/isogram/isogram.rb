module Isogram
  def self.isogram?(string)
    string.length == string.chars.uniq.length
  end
end
