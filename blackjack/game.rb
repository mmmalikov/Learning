require_relative 'Match'
require_relative 'Interface'

class Game
  def self.run
    game = Game.new
    loop do
      case Interface.main_menu
      when 1
        if game.match_start
          game.round
        else
          Interface.no_money
          break
        end
      when 2
        Interface.bye
        break
      else
        Interface.error_message12
        next
      end
    end
  end

  def match_start
    player_name = Interface.ask_name
    @match = Match.new(player_name)
    @match.bets_are_done?
  end

  def round
    loop do
      @match.round_start
      Interface.round(@match.player, @match.bot)
      decision
      get_winner
      if play_again?
        if @match.bets_are_done?
          next
        else
          Interface.no_money
          break
        end
      else
        break
      end
    end
  end

  def decision
    loop do
      case Interface.decision
      when 1
        @match.bot_turn
        break
      when 2
        @match.card_to_player
        @match.bot_turn
        break
      when 3
        break
      else
        Interface.error_message123
        next
      end
    end
  end

  def get_winner
    winner = @match.get_winner
    if winner.nil?
      Interface.result_draw
    else
      Interface.show_winner(winner)
    end
    Interface.round_result(@match.player, @match.bot)
  end

  def play_again?
    case Interface.ask_repeat
    when 1
      true
    when 2
      false
    else
      Interface.error_message12
      play_again?
    end
  end
end
