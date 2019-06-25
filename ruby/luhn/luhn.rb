module Luhn
  def self.valid?(number)
    number = number.gsub(/\s+/, '')
    return false if number.size <= 1 || number.match?(/\D/)

    (sum(number) % 10).zero?
  end

  def self.sum(number)
    number.reverse.split('').map.with_index do |digit, index|
      if index.even?
        digit.to_i
      else
        doubled_digit = digit.to_i * 2
        doubled_digit > 9 ? doubled_digit - 9 : doubled_digit
      end
    end.sum
  end
end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('4539 1488 0343 6467')
  puts Luhn.valid?('055-444-285')
end
