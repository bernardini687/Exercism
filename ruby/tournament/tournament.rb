require 'pry'

class Tournament
  def self.tally(input)
    new(input).tally
  end

  def initialize(match_results)
    @match_results = match_results
    @match_data = {}
  end

  attr_reader :match_results
  attr_accessor :match_data

  def tally
    return header + "\n" if no_data?

    [header, parsed_rows].join "\n"
  end

  def no_data?
    match_results.nil? || match_results.empty?
  end

  def parsed_rows
    rows.map { |row| parse row }
  end

  def rows
    match_results.split "\n"
  end

  def parse(match)
    first_team, second_team, result = match.split ';'
    # if result win
    # match_data[first_team] = wins
    # match_data[second_team] = loses
    # if draw
    # match_data[first_team] = ties
    # match_data[second_team] = ties
    # else
    # match_data[first_team] = loses
    # match_data[second_team] = wins
  end

  # use these as masks to increment the results
  # lastly calculate the points

  def wins
    { mp: 1, won: 1, drawn: 0, lost: 0 }
  end

  def ties
    { mp: 1, won: 0, drawn: 1, lost: 0 }
  end

  def loses
    { mp: 1, won: 0, drawn: 0, lost: 1 }
  end

  def header
    'Team'.ljust(31) + '| MP |  W |  D |  L |  P'
  end
end
