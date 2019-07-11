module Luhn
  class << self
    def valid?(number)
      number = number.gsub(/\s+/, '')
      return false if too_many_chars?(number)
      return false if no_digits?(number)

      (sum(number) % 10).zero?
    end

    private

    def too_many_chars?(number)
      number.size <= 1
    end

    def no_digits?(number)
      number.match?(/\D/)
    end

    def sum(number)
      reverse_pairs(number).sum do |even, odd|
        even.to_i + double(odd)
      end
    end

    def reverse_pairs(number)
      number.reverse.chars.each_slice(2)
    end

    def double(digit)
      doubled_digit = digit.to_i * 2
      doubled_digit > 9 ? doubled_digit - 9 : doubled_digit
    end
  end
end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('4539 1488 0343 6467')
  puts Luhn.valid?('055-444-285')
end

