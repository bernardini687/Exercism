class Matrix
  def initialize(source)
    @source = source
  end

  def rows
    @source.split("\n").map(&:split).each { |e| e.map!(&:to_i) }
  end

  def columns
    rows.transpose
  end
end
