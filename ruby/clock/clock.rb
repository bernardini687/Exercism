class Clock
  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    "#{zero_pad(time[0])}:#{zero_pad(time[1])}"
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
