module Provable
  refine String do
    def too_many_digits?
      size <= 1
    end

    def valid_digits?
      match?(/\D/)
    end
  end
end

module Luhn
  class << self
    def valid?(number)
      number = number.gsub(/\s+/, '')
      return false if number.size <= 1 || number.match?(/\D/)

      (sum(number) % 10).zero?
    end

    private

    def sum(number)
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
end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('4539 1488 0343 6467')
  puts Luhn.valid?('055-444-285')
end

