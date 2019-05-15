class Series
  attr_reader :series
  def initialize(series)
    @series = series
  end

  def slices(num)
    result = []
    series.size.times do |i|
      slice = series[i...i + num]
      result << slice if slice.size == num
    end
    result
  end
end
