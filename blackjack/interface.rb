class Interface
  def self.no_money
    puts 'No enough money for bet!'
  end

  def self.bye
    puts 'Bye!'
  end

  def self.error_message12
    puts 'Error, please repeat with 1 or 2!'
  end

  def self.error_message123
    puts 'Error, please repeat with 1, 2 or 3!'
  end

  def self.result_draw
    puts 'Result of the round:'
    puts '*** ROUND DRAW! ***'
  end

  def self.show_winner(winner)
    puts 'Result of the round:'
    puts "*** #{winner.upcase} WIN! ***"
  end

  def self.decision
    puts 'What to do? 1: SKIP, 2: GET A CARD, 3: OPEN!'
    gets.chomp.to_i
  end

  def self.main_menu
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts 'Welcome to Black-Jack game! select what to do:'
    puts '1. Start a new game'
    puts '2. Exit'
    gets.chomp.to_i
  end

  def self.ask_name
    puts 'Enter your name: '
    gets.chomp.to_s
  end

  def self.ask_repeat
    puts 'What to do? 1: Play again?, 2: Exit to main menu'
    gets.chomp.to_i
  end

  def self.round(player, bot)
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts "NEW ROUND! Your bank: #{player[:wallet]}$"
    puts "#{player[:name]}: #{player[:cards_list]} (#{player[:points]})"
    puts "#{bot[:name]}: ######## (##)"
  end

  def self.round_result(player, bot)
    puts "#{player[:name]}: #{player[:cards_list]} (#{player[:points]})"
    puts "#{bot[:name]}: #{bot[:cards_list]} (#{bot[:points]})"
    puts '= * = * = * = * = * = * = * = * = * = * = * = * = * ='
    puts "Your bank: #{player[:wallet]}$"
  end
end
