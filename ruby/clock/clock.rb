class Clock
  attr_reader :hour, :minute

  def initialize(time)
    @hour = time[:hour]
    @minute = time[:minute]
  end

  def to_s
    "#{hour}:#{minute}"
  end
end
