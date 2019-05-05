module Pangram
  AZ = ('a'..'z').freeze

  def self.pangram?(string)
    AZ.all? { |letter| string.downcase.include?(letter) }
  end
end
