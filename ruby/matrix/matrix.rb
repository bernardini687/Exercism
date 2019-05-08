class Matrix
  def initialize(source)
    @source = source
  end

  def rows
    @source.split("\n").map(&:split).each { |e| e.map!(&:to_i) }
  end

  def columns
    nums = @source.split("\n").map(&:split)
    columns = []
    nums[0].length.times do |index|
      columns << nums.map { |row| row[index].to_i }
    end
    columns
  end
end
