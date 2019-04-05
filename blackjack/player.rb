class Player
  attr_reader :name, :bank, :cards

  def initialize(name = 'Bot', bank = 100)
    @name = name
    @cards = []
    @bank = bank
  end

  def new_card(card)
    @cards.push(card)
  end

  def bet(sum)
    @cards = []
    @bank -= sum
  end

  def profit(sum)
    @bank += sum
  end
end
