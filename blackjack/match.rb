require_relative 'Player'
require_relative 'Deck'

class Match
  def initialize(name1, name2, sum)
    @player = Player.new(name1)
    @bot = Player.new(name2)
    @bet_sum = sum
  end

  def round_start
    @deck = Deck.new
    @player.bet(@bet_sum)
    @bot.bet(@bet_sum)
    @player.new_card(@deck.card)
    @bot.new_card(@deck.card)
    @player.new_card(@deck.card)
    @bot.new_card(@deck.card)
  end

  def card_to_player
    @player.new_card(@deck.card)
  end

  def bot_turn
    @bot.new_card(@deck.card) if Deck.points_of(@bot.cards) >= 18
  end

  def result # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    player = Deck.points_of(@player.cards)
    bot = Deck.points_of(@bot.cards)
    if player == bot
      @player.profit(@bet_sum)
      @bot.profit(@bet_sum)
      return nil
    end
    bot_lose = bot > 21 && player <= 21
    player_won = bot < 21 && player <= 21 && (bot - 21).abs > (player - 21).abs
    if bot_lose || player_won
      @player.profit(@bet_sum * 2)
      return @player.name
    end
    player_lose = bot <= 21 && player > 21
    bot_won = bot <= 21 && player < 21 && (bot - 21).abs < (player - 21).abs
    if player_lose || bot_won # rubocop:disable Style/GuardClause:
      @bot.profit(@bet_sum * 2)
      @bot.name
    end
  end

  def player
    { name: @player.name,
      cards: @player.cards,
      bank: @player.bank,
      points: Deck.points_of(@player.cards) }
  end

  def bot
    { name: @bot.name,
      cards: @bot.cards,
      points: Deck.points_of(@bot.cards) }
  end
end
