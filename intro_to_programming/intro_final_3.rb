array = 1..10

new_array = array.select { |number| number % 2 != 0 }

puts new_array
