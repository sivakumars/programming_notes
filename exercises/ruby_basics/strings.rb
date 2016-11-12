## Question 1

# empty_string = ""
# empty_string_2 = String.new("")

## Question 2

# puts "It's now 12 o'clock."

## Question 3

# name = 'Roger'
#
# if name.downcase == 'RoGeR'.downcase
#   puts true
# else
#   puts false
# end
#
# if name.downcase == 'DAVE'.downcase
#   puts true
# else
#   puts false
# end
#
# puts name.casecmp('RoGeR') == 0
# puts name.casecmp('DAVE') == 0

## Question 4

# name = 'Elizabeth'
#
# puts "Hello, #{name}!"

## Question 5
#
# first_name = 'John'
# last_name = 'Doe'
#
# full_name = "#{first_name} #{last_name}"
#
# puts full_name

## Question 6

# state = 'tExAs'
#
# state.capitalize!
# puts state

## Question 7

# greeting = 'Hello!'
# # greeting.delete!(greeting).concat('Goodbye!')
# greeting.gsub!(greeting, 'Goodbye!')
#
# puts greeting

## Question 8

# alphabet = 'abcdefghijklmnopqrstuvwxyz'
#
# p alphabet.split('')

## Question 9

# words = 'car human elephant airplane'
#
# words.split.each { |word| puts "#{word}s" }

## Question 10

colors = 'blue pink yellow orange'

puts colors.split.include?('yellow')
puts colors.split.include?('purple')
