module Luhn
  def self.valid?(number)
    return false if number.strip.size <= 1

    (sum(number) % 10).zero?
  end

  def self.sum(number)
    number.gsub(/\s+/, '').reverse.split('').map.with_index do |n, i|
      if i.even?
        n.to_i
      else
        double = n.to_i * 2
        double > 9 ? double - 9 : double
      end
    end.sum
  end
end

if $PROGRAM_NAME == __FILE__
  p Luhn.valid?('4539 1488 0343 6467')
end
