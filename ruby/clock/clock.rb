class Clock
  def initialize(hour: 0, minute: 0)
    @hour = hour
    @minute = minute
  end

  def to_s
    "#{zero_pad(hour)}:#{zero_pad(minute)}"
  end

  def +(other_clock)
    Clock.new(
      hour: hour + other_clock.hour,
      minute: minute + other_clock.minute
    )
  end

  def -(other_clock)
    Clock.new(
      hour: hour - other_clock.hour,
      minute: minute - other_clock.minute
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

  def hour
    time[0]
  end

  def minute
    time[1]
  end

  private

  def zero_pad(number)
    '%02d' % number
  end
end
