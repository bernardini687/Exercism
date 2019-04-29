module Acronym
  def self.abbreviate(string)
    string.split(/\b/).map { |w| w[0].capitalize }.join.tr('^A-Za-z', '')
  end
end
