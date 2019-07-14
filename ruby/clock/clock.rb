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
        roll_over(raw_hour, 24)
      elsif raw_hour == 24
        0
      else
        raw_hour
      end
    end
  end

  def minute
    @minute ||= begin
      if raw_minute > 60
        roll_over(raw_minute, 60)
      elsif raw_minute == 60
        self.raw_hour += 1
        0
      else
        raw_minute
      end
    end
  end

  def to_s
    minutes = zero_pad(minute)
    "#{zero_pad(hour)}:#{minutes}"
  end

  def zero_pad(number)
    "%02d" % number
  end

  private

  def roll_over(time, amount)
    return time if time <= amount

    less = time - amount
    self.raw_hour += 1 if amount == 60
    roll_over(less, amount)
  end
end
