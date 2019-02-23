numbers = [0, 1]

numbers << numbers[-1] + numbers[-2] while (numbers[-1] + numbers[-2]) <= 100

puts numbers
