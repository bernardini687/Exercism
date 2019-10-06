class School
  def initialize
    @data = Array.new(12) { |grade| [grade + 1, []] }.to_h
  end

  private

  attr_accessor :data
end
