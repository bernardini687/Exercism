class Clock
  attr_reader :hour, :minute

  def initialize(time)
    @hour = time[:hour] || 0
    @minute = time[:minute] || 0
  end

  def to_s
    "#{zero_pad(hour)}:#{zero_pad(minute)}"
  end

  def zero_pad(number)
    "%02d" % number
  end
end
