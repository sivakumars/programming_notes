puts "Hey there. How old are ya?"
age = gets.chomp.to_i

age_in_ten = (age + 10).to_s
age_in_twenty = (age + 20).to_s
age_in_thirty = (age + 30).to_s
age_in_forty = (age + 40).to_s

puts "In 10 years you'll be #{age_in_ten} years old."
puts "In 20 years you'll be #{age_in_twenty} years old."
puts "In 30 years you'll be #{age_in_thirty} years old."
puts "In 40 years you'll be #{age_in_forty} years old."
