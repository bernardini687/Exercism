class Tournament
  def self.tally(log)
    new(log).tally
  end

  def initialize(log)
    @log = log
    @store = {}
  end

  attr_reader :log, :store

  def tally
    return header + "\n" if no_data?

    [header, rows].join("\n") + "\n"
  end

  private

  def header
    row 'Team', '| MP |  W |  D |  L |  P'
  end

  def row(name, data, padding: 31)
    name.ljust(padding) + data
  end

  def no_data?
    log.nil? || log.strip.empty?
  end

  def rows
    log_lines.each { |line| parse line }
    rows = []

    teams.zip data do |team, data|
      rows << row(team, data)
    end

    # sort alphabetically first, then sort by points
    rows.sort.sort_by { |data| -points(data) }
  end

  def log_lines
    log.split "\n"
  end

  def parse(line)
    first_team, second_team, result = line.split ';'
    if result == 'win'
      store[first_team] = save first_team, :wins
      store[second_team] = save second_team, :loses
    elsif result == 'draw'
      store[first_team] = save first_team, :ties
      store[second_team] = save second_team, :ties
    else
      store[first_team] = save first_team, :loses
      store[second_team] = save second_team, :wins
    end
  end

  def save(team, verb)
    # update the stored records or add their first data
    store[team]&.merge(method(verb).call) do |_, old_data, new_data|
      old_data + new_data
    end || method(verb).call
  end

  # use the following verbs as masks to update the stored records

  def wins
    # (m)atches (p)layed, (w)on, (d)rawn, (l)ost
    { mp: 1, w: 1, d: 0, l: 0 }
  end

  def ties
    { mp: 1, w: 0, d: 1, l: 0 }
  end

  def loses
    { mp: 1, w: 0, d: 0, l: 1 }
  end

  def teams
    store.keys
  end

  def data
    store.values.map do |data|
      points = calculate_points(data)
      "|  #{data[:mp]} |  #{data[:w]} |  #{data[:d]} |  #{data[:l]} |  #{points}"
    end
  end

  def calculate_points(data)
    data[:w] * 3 + data[:d]
  end

  def points(data)
    data[/\d+\z/].to_i
  end
end
