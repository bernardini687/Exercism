module Provable
  refine String do
    def has_too_many_digits?
      size <= 1
    end

    def has_invalid_digits?
      match?(/\D/)
    end

    def reverse_chars
      reverse.chars
    end

    def to_luhn_double_i
      doubled_digit = to_i * 2
      doubled_digit > 9 ? doubled_digit - 9 : doubled_digit
    end
  end
end

class Luhn
  using Provable

  def self.valid?(number)
    number = number.gsub(/\s+/, '')
    return false if number.has_too_many_digits?
    return false if number.has_invalid_digits?

    (sum(number) % 10).zero?
  end

  private

  def self.sum(number)
    number.reverse_chars.each_slice(2).flat_map do |pair|
      [pair.first.to_i, pair.last.to_luhn_double_i]
    end.sum
  end
end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('4539 1488 0343 6467')
  puts Luhn.valid?('055-444-285')
end

