class Series
  attr_reader :nums
  def initialize(nums)
    @nums = nums
  end

  def slices(limit)
    if nums.size < limit
      raise ArgumentError, "Expected #{limit} to be ≤ #{nums.size}"
    end

    nums.chars.each_cons(limit).map(&:join)
  end
end
