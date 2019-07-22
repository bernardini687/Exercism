class Clock
  def initialize(time)
    @hour = time[:hour] || 0
    @minute = time[:minute] || 0
    @minutes = time[:minutes]
  end

  def minutes
    @minutes ||= (@hour * 60) + @minute
  end

  def to_s
    "#{zero_pad h}:#{zero_pad m}"
  end

  def +(clock)
    Clock.new(minutes: minutes + clock.minutes)
  end

  def -(clock)
    Clock.new(minutes: minutes - clock.minutes)
  end

  def ==(clock)
    to_s == clock.to_s
  end

  private

  def m
    minutes % 60
  end

  def h
    roll_over(minutes / 60)
  end

  def zero_pad(time)
    '%02d' % time
  end

  def roll_over(time)
    if time < 24 && time >= 0
      return time
    elsif time < 0
      return roll_over(time + 24)
    end

    roll_over(time - 24)
  end
end
