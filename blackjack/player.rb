class Player
  attr_reader :name, :wallet, :cards

  def initialize(name = 'Bot', wallet = 100)
    @name = name
    @cards = []
    @wallet = wallet
  end

  def get_card(card)
    @cards.push(card)
  end

  def bet(sum)
    if sum <= @wallet
      @cards = []
      @wallet -= sum
    else
      false
    end
  end

  def profit(sum)
    @wallet += sum
  end

  def points
    sum = 0
    @cards.each do |card|
      if card.to_s.include?('A')
        sum += 11 if (21 - sum + 11).abs < (21 - sum + 1).abs && sum + 11 < 21
        sum += 1 if (21 - sum + 11).abs > (21 - sum + 1).abs && sum + 1 <= 21
      else
        sum += card.points
      end
    end
    sum
  end

  def cards_list
    @cards.map(&:to_s)
  end

end
