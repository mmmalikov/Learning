require_relative 'Player'
require_relative 'Deck'
require_relative 'bank'

class Match
  def initialize(name1, name2, sum)
    @player = Player.new(name1)
    @bot = Player.new(name2)
    @bet_sum = sum
  end

  def round_start
    @deck = Deck.new
    @bank = Bank.new
    @bank.make_bet(@player, @bet_sum)
    @bank.make_bet(@bot, @bet_sum)
    @player.get_card(@deck.card)
    @bot.get_card(@deck.card)
    @player.get_card(@deck.card)
    @bot.get_card(@deck.card)
  end

  def card_to_player
    @player.get_card(@deck.card)
  end

  def bot_turn
    @bot.get_card(@deck.card) if @bot.points >= 18
  end

  def get_winner # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    player = @player.points
    bot = @bot.points
    if player == bot
      @bank.prize(@player, @bot)
      return nil
    end
    bot_lose = bot > 21 && player <= 21
    player_won = bot < 21 && player <= 21 && (bot - 21).abs > (player - 21).abs
    if bot_lose || player_won
      @bank.prize(@player)
      return @player.name
    end
    player_lose = bot <= 21 && player > 21
    bot_won = bot <= 21 && player < 21 && (bot - 21).abs < (player - 21).abs
    if player_lose || bot_won # rubocop:disable Style/GuardClause:
      @bank.prize(@bot)
      @bot.name
    end
  end

  def player
    { name: @player.name,
      cards: @player.cards.to_s,
      wallet: @player.wallet,
      points: @player.points }
  end

  def bot
    { name: @bot.name,
      cards: @bot.cards,
      points: @bot.points }
  end
end
