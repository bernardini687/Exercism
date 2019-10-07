class School
  def initialize
    @data = Array.new(12) { |grade| [grade + 1, []] }.to_h
  end

  def students(grade)
    data[grade]
  end

  def add(name, grade)
    data[grade] << name
    data[grade].sort!
  end

  private

  attr_accessor :data
end
