class Luhn
  attr_reader :raw_number

  def initialize(raw_number)
    @raw_number = raw_number
  end

  def self.valid?(number)
    number = number.gsub(/\s+/, '')
    number = Luhn.new(number) unless self.class == Luhn

    return false if number.has_too_many_chars?
    return false if number.has_no_digits?

    (number.sum % 10).zero?
  end

  def valid?
    Luhn.valid?(@number)
  end

  def has_too_many_chars?
    @number.size <= 1
  end

  def has_no_digits?
    @number.match(/\D/)
  end

  def sum
    reverse_pairs(@number).sum do |even, odd|
      even.to_i + double(odd)
    end
  end

  # private

  def reverse_pairs
    @number.reverse.chars.each_slice(2)
  end

  def double(digit)
    doubled_digit = digit.to_i * 2
    doubled_digit > 9 ? doubled_digit - 9 : doubled_digit
  end
end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('4539 1488 0343 6467')
  puts Luhn.valid?('055-444-285')
end
