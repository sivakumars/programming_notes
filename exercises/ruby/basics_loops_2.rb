## Question 1

# count = 1
#
# loop do
#     if count.odd?
#       puts "#{count} is odd!"
#     else
#       puts "#{count} is even!"
#     end
#   count += 1
#   break if count > 5
# end

# numbers = (1..5).to_a
#
# numbers.each do |number|
#   if number.odd?
#     number_type = "odd"
#   else
#     number_type = "even"
#   end
#   puts "#{number} is #{number_type}!"
# end

## Question 2

# loop do
#   number = rand(100)
#   puts number
#   break if number >= 0 && number <= 10
# end

# loop do
#   number = rand(100)
#   puts number
#   break if number.between?(0,10)
# end

## Question 3

# process_the_loop = [true, false].sample
#
# if process_the_loop
#   loop do
#     puts "The loop was processed!"
#     break
#   end
# else
#   puts "The loop wasn't processed!"
# end

## Question 4

# loop do
#   puts 'What does 2 + 2 equal?'
#   answer = gets.chomp.to_i
#
#   if answer == 4
#     puts "That's correct!"
#     break
#   end
#
#   puts "Wrong answer. Try again!"
# end

## Question 5

# numbers = []
#
# loop do
#   puts 'Enter any number:'
#   numbers.push(gets.chomp.to_i)
#   break if numbers.size == 5
# end
#
# puts numbers

## Question 6

# names = ['Sally', 'Joe', 'Lisa', 'Henry']
#
# loop do
#   puts names.shift # or names.pop to print names in reverse
#   break if names.empty?
# end

## Question 7

# 5.times do |index|
#   puts index
#   break if index == 2
# end

## Question 8

# number = 0
#
# until number == 10
#   number += 1
#   next if number.odd?
#   puts number
# end

## Question 9

# number_a = 0
# number_b = 0
#
# loop do
#   number_a += rand(2)
#   number_b += rand(2)
#   next unless number_a == 5 || number_b == 5
#
#   puts "5 was reached!"
#   break
# end

## Question 10

# def greeting
#   puts 'Hello!'
# end
#
# number_of_greetings = 2
#
# while number_of_greetings > 0
#   greeting
#   number_of_greetings -= 1
# end
