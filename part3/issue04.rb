vowels = %w(a e i o u y)
alphabet = ('a'..'z')
needed = {}

alphabet.each.with_index(1) { |letter, index| needed[letter] = index if vowels.include?(letter) }

print needed
