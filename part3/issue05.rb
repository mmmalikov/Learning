print 'Enter day: '
day = gets.chomp.to_i

print 'Enter month: '
month = gets.chomp.to_i

print 'Enter yaer: '
year = gets.chomp.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

if year % 4 == 0 and year % 100 != 0 or year % 400 == 0
  months[1] = 29
end

i = 0
sum = 0

while i < month - 1
  sum += months[i]
  i += 1
end

sum += day

puts "Summ of days = #{sum}!"
