class HighScores
  attr_reader :scores

  def initialize(scores)
    @scores = scores
    # Sort only once per instantiation.
    @sorted_scores = scores.sort
  end

  def latest
    @scores.last
  end

  def personal_best
    @sorted_scores.last
  end

  def personal_top_three
    @sorted_scores.last(3).reverse
  end
end
