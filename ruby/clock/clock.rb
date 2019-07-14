class Clock
  DAY, HOUR = 24, 60
  attr_accessor :raw_hour
  attr_reader :raw_minute

  def initialize(time)
    @raw_hour = time[:hour] || 0
    @raw_minute = time[:minute] || 0
  end

  def hour
    @hour ||= begin
      if raw_hour > DAY
        roll_over_hour(raw_hour, :-)
      elsif raw_hour == DAY
        0
      elsif raw_hour < 0
        roll_over_hour(raw_hour, :+)
      else
        raw_hour
      end
    end
  end

  def minute
    @minute ||= begin
      if raw_minute > HOUR
        roll_over_minute(raw_minute, :-)
      elsif raw_minute == HOUR
        self.raw_hour += 1
        0
      elsif raw_minute < 0
        roll_over_minute(raw_minute, :+)
      else
        raw_minute
      end
    end
  end

  def to_s
    minutes = zero_pad(minute) # Minutes first to allocate exceeding hours
    "#{zero_pad(hour)}:#{minutes}"
  end

  def +(clock)
    hours = raw_hour + clock.raw_hour
    minutes = raw_minute + clock.raw_minute
    Clock.new(hour: hours, minute: minutes)
  end

  def -(clock)
    hours = raw_hour - clock.raw_hour
    minutes = raw_minute - clock.raw_minute
    Clock.new(hour: hours, minute: minutes)
  end

  def ==(clock)
    self.to_s == clock.to_s
  end

  private

  def zero_pad(number)
    '%02d' % number
  end

  def roll_over_hour(time, op)
    if time < DAY && time >= 0
      return time
    elsif time == DAY
      return 0
    end

    roll_over_hour(time.send(op, DAY), op)
  end

  def roll_over_minute(time, op)
    if time < HOUR && time >= 0
      return time
    elsif time == HOUR
      self.raw_hour += 1
      return 0
    end

    if op == :-
      self.raw_hour += 1
    else
      self.raw_hour -= 1
    end
    roll_over_minute(time.send(op, HOUR), op)
  end
end
