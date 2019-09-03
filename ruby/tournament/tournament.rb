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

    [header, parsed_rows].join("\n") + "\n"
  end

  def no_data?
    match_results.nil? || match_results.strip.empty?
  end

  def parsed_rows
    rows.each { |row| parse row }
    result = []

    match_data.keys.zip(tabulize(match_data.values)) do |name, data|
      result << name.ljust(31) + data
    end
    result.sort.sort_by { |data| -data[-1].to_i }
  end

  def rows
    match_results.split "\n"
  end

  def parse(match)
    first_team, second_team, result = match.split ';'
    case result
    when 'win'
      match_data[first_team] = match_data[first_team]&.merge(wins) { |_, n, o| n + o } || wins
      match_data[second_team] = match_data[second_team]&.merge(loses) { |_, n, o| n + o } || loses
    when 'draw'
      match_data[first_team] = match_data[first_team]&.merge(ties) { |_, n, o| n + o } || ties
      match_data[second_team] = match_data[second_team]&.merge(ties) { |_, n, o| n + o } || ties
    else
      match_data[first_team] = match_data[first_team]&.merge(loses) { |_, n, o| n + o } || loses
      match_data[second_team] = match_data[second_team]&.merge(wins) { |_, n, o| n + o } || wins
    end
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

  def tabulize(values)
    values.map do |v|
      points = total_points(v)
      "|  #{v[:mp]} |  #{v[:won]} |  #{v[:drawn]} |  #{v[:lost]} |  #{points}"
    end
  end

  def total_points(data)
    data[:won] * 3 + data[:drawn]
  end
end
