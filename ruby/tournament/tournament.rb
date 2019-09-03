require 'pry'

class Tournament
  def self.tally(logs)
    new(logs).tally
  end

  def initialize(logs)
    @logs = logs
    @store = {}
  end

  attr_reader :logs, :store

  def tally
    return header + "\n" if no_data?

    [header, parsed_rows].join("\n") + "\n"
  end

  def no_data?
    logs.nil? || logs.strip.empty?
  end

  def parsed_rows
    rows.each { |row| parse row }
    result = []

    store.keys.zip(tabulize(store.values)) do |name, data|
      result << name.ljust(31) + data
    end
    result.sort.sort_by { |data| -data[-1].to_i }
  end

  def rows
    logs.split "\n"
  end

  def parse(match)
    first_team, second_team, result = match.split ';'
    case result
    when 'win'
      store[first_team] = foo(first_team, :wins)
      store[second_team] = foo(second_team, :loses)
    when 'draw'
      store[first_team] = foo(first_team, :ties)
      store[second_team] = foo(second_team, :ties)
    else
      store[first_team] = foo(first_team, :loses)
      store[second_team] = foo(second_team, :wins)
    end
  end

  # use these as masks to increment the results
  # lastly calculate the points

  def foo(team, result)
    store[team]&.merge(method(result).call) { |_, n, o| n + o } || method(result).call
  end

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
