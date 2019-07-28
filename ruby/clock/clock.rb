class Clock
  def initialize(clock)
    @hour = clock[:hour] || 0
    @minute = clock[:minute] || 0
  end

  def to_s
    hour, minute = time
    "#{zero_pad(hour)}:#{zero_pad(minute)}"
  end

  def +(other_clock)
    Clock.new(
      hour: time[0] + other_clock.time[0],
      minute: time[1] + other_clock.time[1]
    )
  end

  def -(other_clock)
    Clock.new(
      hour: time[0] - other_clock.time[0],
      minute: time[1] - other_clock.time[1]
    )
  end

  def ==(other_clock)
    time == other_clock.time
  end

  protected

  def time
    @time ||= begin
      hour, minute = (@hour * 60 + @minute).divmod(60)
      [hour % 24, minute]
    end
  end

  private

  def zero_pad(number)
    '%02d' % number
  end
end
