class Clock
  attr_reader :minute, :hour

  def initialize(time)
    @minute = time[:minute] || 0
    @hour = time[:hour] || 0
  end

  def minutes
    @minutes ||= (hour * 60) + minute
  end

  def h
    roll_over(minutes / 60)
  end

  def m
    minutes % 60
  end

  def to_s
    "#{zero_pad(h)}:#{zero_pad(m)}"
  end

  def +(clock)
    m = minute + clock.minute
    h = hour + clock.hour
    Clock.new(hour: h, minute: m)
  end

#  def -(clock)
#  end
#
#  def ==(clock)
#    self.to_s == clock.to_s
#  end

  private

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
