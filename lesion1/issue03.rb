print 'Введите первую сторону: '
a = gets.chomp.to_f

print 'Введите вторую сторону: '
b = gets.chomp.to_f

print 'Введите третью сторону: '
c = gets.chomp.to_f

if a == b || a == c || b == c
  print 'Треугольник равнобедренный '
  puts 'и равносторонний!' if a == c && a == b
end

side = [a, b, c].sort!

if side[2]**2 == side[1]**2 + side[0]**2
  puts 'Треугольник прямоугольный!'
else
  puts 'Треугольник не прямоугольный!'
end
