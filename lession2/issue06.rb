list = {}

loop do
  puts 'Enter item'
  input = gets.chomp
  if input == 'stop'
    puts 'Stopped'
    break
  end
  puts 'Enter price'
  price = gets.chomp.to_f

  puts 'Enter count'
  count = gets.chomp.to_i

  list[input] = { price: price, quantity: count }
end

puts 'list of items'

summ = 0

list.each do |x, y|
  puts "#{x}: #{y[:price]}$ - #{y[:quantity]}"
  summ += y[:price] * y[:quantity]
end

puts "Summ of order = #{summ}"
