require 'pry'

class Clock
  attr_accessor :raw_hour
  attr_reader :raw_minute

  def initialize(time)
    @raw_hour = time[:hour] || 0
    @raw_minute = time[:minute] || 0
  end

  def hour
    @hour ||= begin
      if raw_hour > 24
        roll_over_hour(raw_hour, :-)
      elsif raw_hour == 24
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
      if raw_minute > 60
        roll_over_minute(raw_minute, :-)
      elsif raw_minute == 60
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

  def zero_pad(number)
    "%02d" % number
  end

  private

  def roll_over_hour(time, op)
    if time < 24 && time >= 0
      return time
    elsif time == 24
      return 0
    end

    roll_over_hour(time.send(op, 24), op)
  end

  def roll_over_minute(time, op)
    if time < 60 && time >= 0
      return time
    elsif time == 60
      self.raw_hour += 1
      return 0
    end

    if op == :-
      self.raw_hour += 1
    else
      self.raw_hour -= 1
    end
    roll_over_minute(time.send(op, 60), op)
  end
end

if $PROGRAM_NAME == __FILE__
  puts Clock.new(minute: 120).to_s
  puts Clock.new(hour: 48).to_s
  puts Clock.new(hour: 48, minute: 120).to_s
  puts Clock.new(hour: 10) + Clock.new(minute: 61)
end
