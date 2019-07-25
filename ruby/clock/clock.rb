class Clock
  def initialize(time)
    @hour = time[:hour] || 0
    @minute = time[:minute] || 0
    @base_unit = time[:base_unit]
  end

  def to_s
    "#{zero_pad(time[0])}:#{zero_pad(time[1])}"
  end

  def +(clock)
    Clock.new(base_unit: base_unit + clock.base_unit)
  end

  def -(clock)
    Clock.new(base_unit: base_unit - clock.base_unit)
  end

  def ==(clock)
    time == clock.time
  end

  protected

  def base_unit
    @base_unit ||= (@hour % 24) * 60 + @minute
  end

  def time
    [(base_unit / 60) % 24, base_unit % 60]
  end

  private

  def zero_pad(time)
    '%02d' % time
  end
end
