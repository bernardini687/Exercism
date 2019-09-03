class Tournament
  attr_reader :match_results

  def self.tally(input)
    new(input).tally
  end

  def initialize(match_results)
    @match_results = match_results
  end

  def tally
    header
  end

  def header
    'Team'.ljust(31) + "| MP |  W |  D |  L |  P\n"
  end
end
