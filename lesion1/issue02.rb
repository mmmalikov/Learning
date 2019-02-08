puts 'Приветствую, пожалуйста введите основание треугольника'
base = gets.chomp.to_f

puts 'Пожалуйста введите высоту треугольника'
height = gets.chomp.to_f
print "Площадь треугольника: #{base * height * 0.5}"
