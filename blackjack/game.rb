require_relative 'Match'

class Game
  def self.run
    game = Game.new
    loop do
        game.show_menu
        input = gets.chomp.to_i
        case input
        when 1
          game.match_start
        when 2
          puts 'Bye!'
          break
        else
          puts '... try again!'
        end
    end
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
    round
  end

  def show_cards
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts "NEW ROUND! Your bank:#{@match.player[:wallet]}$"
    puts "#{@match.player[:name]}: #{@match.player[:cards]} (#{@match.player[:points]})"
    puts "#{@match.bot[:name]}: ######## (##)"
  end

  def round
    @match.round_start
    show_cards
    puts 'What to do? 1: SKIP, 2: GET A CARD, 3: OPEN!'
    input = gets.chomp.to_i
    case input
    when 1
      @match.bot_turn
      get_winner
    when 2
      @match.card_to_player
      @match.bot_turn
      get_winner
    when 3
      get_winner
    else
      puts ''
    end
  end

  def get_winner
    puts 'Result of the round:'
    winner = @match.result
    if winner.nil?
      puts '*** ROUND DRAW! ***'
    else
      puts "*** #{winner.upcase} WIN! ***"
    end
    puts "#{@match.player[:name]}: #{@match.player[:cards]} (#{@match.player[:points]})"
    puts "#{@match.bot[:name]}: #{@match.bot[:cards]} (#{@match.bot[:points]})"
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts "Your bank: #{@match.player[:wallet]}$"
    puts 'What to do? 1: Play again!, 2: Exit'
    input = gets.chomp.to_i
    case input
    when 1
      round
    when 2
      puts 'Bye!'
    else
      puts 'What?..'
    end
  end
end
