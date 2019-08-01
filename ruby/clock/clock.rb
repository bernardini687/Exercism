class Clock
  attr_reader :time

  def initialize(time: nil, hour: 0, minute: 0)
    @time = time.nil? ? (hour * 60 + minute) % 1440 : time % 1440
  end

  def to_s
    "#{zero_pad(time / 60)}:#{zero_pad(time % 60)}"
  end

  def +(other_clock)
    Clock.new(time: time + other_clock.time)
  end

  def -(other_clock)
    Clock.new(time: time - other_clock.time)
  end

  def ==(other_clock)
    time == other_clock.time
  end

  private

  def zero_pad(number)
    '%02d' % number
  end
end
