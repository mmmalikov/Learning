class Card
  attr_reader :points

  def initialize(suit, rang, points)
    @suit = suit
    @rang = rang
    @points = points
  end

  def to_s
    @rang + ' ' + @suit
  end
end
