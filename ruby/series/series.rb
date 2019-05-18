class Series
  attr_reader :nums
  def initialize(nums)
    @nums = nums
  end

  def slices(limit)
    if nums.size < limit
      raise ArgumentError.new, "Expected #{limit} to be ≤ #{nums.size}"
    end

    series = []
    nums.size.times do |i|
      slice = nums[i...i + limit]
      series << slice if slice.size == limit
    end
    series
  end
end
