require 'pry'
class Clock
  def initialize(time)
    @hour = time[:hour] || 0
    @minute = time[:minute] || 0
    @minutes = time[:minutes]
  end

  def to_s
    "#{zero_pad(hour)}:#{zero_pad(minute)}"
  end

  def +(clock)
    Clock.new(minutes: minutes + clock.minutes)
  end

  def -(clock)
    Clock.new(minutes: minutes - clock.minutes)
  end

  def ==(clock)
    hour == clock.hour && minute == clock.minute
  end

  protected

  def minutes
    @minutes ||= (@hour * 60) + @minute
  end

  def minute
    minutes % 60
  end

  def hour
    (minutes / 60) % 24
  end

  private

  def zero_pad(time)
    '%02d' % time
  end
end
