## Question 1

# puts "Teddy is #{rand(20..200)} years old!"

## Question 2

# SQMETERS_TO_SQFEET = 10.7639

# puts ">> Enter the length of the room (in meters):"
# length = gets.chomp.to_f
#
# puts ">> Enter the width of the room (in meters):"
# width = gets.chomp.to_f
#
# area = (length * width).round(2)
# area_feet = (area * SQMETERS_TO_SQFEET).round(2)
#
# puts "The area of the room is #{area} square meters (#{area_feet} square feet)."

## Question 3

# print ">> What is the bill? "
# bill = gets.chomp.to_f
#
# print ">> What is the tip percentage? "
# percentage = gets.chomp.to_f
#
# tip = (bill * percentage/100).round(2)
# total = (bill + tip).round(2)
#
# puts "The tip is $#{tip}"
# puts "The total is $#{total}"

## Question 4

# print ">> What is your age? "
# age = gets.chomp.to_i
#
# print ">> At what age would you like to retire? "
# retirement_age = gets.chomp.to_i
#
# years_remaining = retirement_age - age
# current_year = Time.now.year
# retirement_year = current_year + years_remaining
#
# puts "It's #{current_year}. You will retire in #{retirement_year}."
# puts "You have only #{years_remaining} years of work to go!"

## Question 5

# print ">> What is your name? "
# name = gets.chomp
#
# if name.chars.last == '!'
#   puts "HELLO #{name.chop.upcase}. WHY ARE WE SCREAMING?"
# else
#   puts "Hello #{name}."
# end

## Question 6

# (1..99).to_a.each { |number| puts number if number.odd? }

## Question 7

# value = 1
#
# while value <= 99
#   puts value if value.even?
#   value += 1
# end

## Question 8

# num = ''
#
# loop do
#   puts ">> Please enter an integer greater than 0:"
#   num = gets.chomp
#   break if (num.to_i > 0) && (num.to_i.to_s == num)
#   puts ">> Invalid input!"
# end
#
# operation = ''
#
# loop do
#   puts ">> Enter 's' to compute the sum, 'p' to compute the product."
#   operation = gets.chomp
#   break if operation == 's' || operation == 'p'
#   puts ">> Invalid input!"
# end
#
# if operation == 's'
#   result = (1..num.to_i).reduce(:+)
#   full_operation = 'sum'
# else
#   result = (1..num.to_i).reduce(:*)
#   full_operation = 'product'
# end
#
# puts "The #{full_operation} of the integers between #{1} and #{num} is #{result}."

## Question 9

# 'BOB'
# 'BOB'
#
# After the two assignments, the variables name and save_name are both
# pointing to 'Bob'. After name.upcase!, the memory location that they're
# pointing to is destructively changed to 'BOB' and therefore both
# variables now point to 'BOB'.

## Question 10

# array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
# array2 = []
# array1.each { |value| array2 << value }
# array1.each { |value| value.upcase! if value.start_with?('C') }
# puts array2
#
# It should print the original array. [ Moe, Larry, ...]
# The reason is because array2 is populated using the concat operation,
# it points to a new location in memory, separate from array1. So the
# 2nd each loop doesn't affect array2.

# WRONG WRONG WRONG. Reread chapter to figure out why. 
