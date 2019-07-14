class Clock
  attr_reader :raw_hour, :minute

  def initialize(time)
    @raw_hour = time[:hour] || 0
    @minute = time[:minute] || 0
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

  def to_s
    "#{zero_pad(hour)}:#{zero_pad(minute)}"
  end

  def zero_pad(number)
    "%02d" % number
  end

  private

  def roll_over(time, amount)
    return time if time <= amount

    less = time - amount
    roll_over(less, amount)
  end
end
