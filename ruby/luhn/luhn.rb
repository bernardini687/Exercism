class Luhn
  def self.valid?(number)
    number = number.gsub(/\s+/, '')
    return false if too_many_chars?(number)
    return false if no_digits?(number)

    (sum(number) % 10).zero?
  end

  private

  def self.too_many_chars?(number)
    number.size <= 1
  end

  def self.no_digits?(number)
    number.match?(/\D/)
  end

  def self.sum(number)
    reverse_pairs(number).flat_map do |pair|
      [pair.first.to_i, double(pair.last)]
    end.sum
  end

  def self.reverse_pairs(number)
    number.reverse.chars.each_slice(2)
  end

  def self.double(digit)
    doubled_digit = digit.to_i * 2
    doubled_digit > 9 ? doubled_digit - 9 : doubled_digit
  end
end

if $PROGRAM_NAME == __FILE__
  puts Luhn.valid?('4539 1488 0343 6467')
  puts Luhn.valid?('055-444-285')
end

