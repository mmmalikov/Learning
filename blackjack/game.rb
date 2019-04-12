require_relative 'Match'

class Game
  def self.run
    game = Game.new
    loop do
      game.show_menu
      input = gets.chomp.to_i
      game.match_start
      case input
      when 1
        game.round_start
        game.show_cards
        game.decision
        game.get_winner
        if game.play_again?
          next
        else
          puts 'Bye!'
          break
        end
      when 2
        puts 'Bye!'
        break
      else
        puts 'Error, please repeat with 1 or 2!'
        next
      end
    end
  end

  def round_start
    @match.round_start
  end

  def show_menu
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts 'Welcome to Black-Jack game! select what to do:'
    puts '1. Start a new game'
    puts '2. Exit'
  end

  def match_start
    puts 'Enter your name: '
    input = gets.chomp.to_s
    @match = Match.new(input, 'Robot', 10)
  end

  def show_cards
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts "NEW ROUND! Your bank:#{@match.player[:wallet]}$"
    puts "#{@match.player[:name]}: #{@match.player[:cards]} (#{@match.player[:points]})"
    puts "#{@match.bot[:name]}: ######## (##)"
  end

  def decision
    loop do
      puts 'What to do? 1: SKIP, 2: GET A CARD, 3: OPEN!'
      input = gets.chomp.to_i
      case input
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
        puts 'Error, please repeat with 1, 2 or 3!'
        next
      end
    end

  end

  def get_winner
    puts 'Result of the round:'
    winner = @match.get_winner
    if winner.nil?
      puts '*** ROUND DRAW! ***'
    else
      puts "*** #{winner.upcase} WIN! ***"
    end
    puts "#{@match.player[:name]}: #{@match.player[:cards]} (#{@match.player[:points]})"
    puts "#{@match.bot[:name]}: #{@match.bot[:cards]} (#{@match.bot[:points]})"
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts "Your bank: #{@match.player[:wallet]}$"
  end

  def play_again?
    loop do
      puts 'What to do? 1: Open main menu, 2: Exit'
      input = gets.chomp.to_i
      case input
      when 1
        return true
      when 2
        return false
      else
        puts 'Error, please repeat with 1 or 2!'
        next
      end
    end
  end
end
