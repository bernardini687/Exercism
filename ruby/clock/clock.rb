class Clock
  def initialize(time)
    @minute = time[:minute] || 0
    @hour = time[:hour] || 0
  end

  def minutes
    @minutes ||= (@hour * 60) + @minute
  end

  def hour
    roll_over(minutes / 60)
  end

  def minute
    minutes % 60
  end

  def to_s
    "#{zero_pad(hour)}:#{zero_pad(minute)}"
  end

  def +(clock)
  end

  def -(clock)
  end

  def ==(clock)
    self.to_s == clock.to_s
  end

  private

  def zero_pad(time)
    '%02d' % time
  end

  def roll_over(time)
    if time < 24 && time >= 0
      return time
    end

    roll_over(time - 24)
  end
end
