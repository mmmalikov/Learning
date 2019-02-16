input = ''
list = {}
price = 0
count = 0
summ = 0

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

  list[input] = { price => count }
end

puts 'list of items'

list.each do |x, y|
  puts "#{x}: #{y.keys[0]}$ - #{y[y.keys[0]]}"
  summ += y.keys[0] * y[y.keys[0]]
end

puts "Summ of order = #{summ}"
