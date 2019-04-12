class Bank
  def initialize
    @account = 0
  end

  def make_bet(player, summ)
    player.bet(summ)
    @account += summ
  end

  def prize(first_player, second_player = nil)
    if second_player
      first_player.profit(@account/2)
      second_player.profit(@account/2)
    else
      first_player.profit(@account)
    end
    @account = 0
  end
end
