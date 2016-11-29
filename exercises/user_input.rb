## Question 1

# puts ">> Type anything you want:"
# input = gets.chomp
# puts input

## Question 2

# puts ">> What is your age in years?"
# age_in_years = gets.chomp.to_i
# age_in_months = input * 12
# puts "You are #{age_in_months} months old."

## Question 3

# puts ">> Do you want me to print something? (y/n)"
# answer = gets.chomp.downcase
# puts "something" if answer == 'y'

## Question 4

# loop do
#   puts '>> Do you want me to print something? (y/n)'
#   answer = gets.chomp.downcase
#   puts "something" if answer == 'y'
#   break if answer == 'y' || answer == 'n'
#   puts ">> Invalid input! Please enter y or n."
# end

## Question 5

# number_lines = nil
#
# loop do
#   puts '>> How many output lines do you want? Enter a number >= 3:'
#   number_lines = gets.chomp.to_i
#   break if number_lines >= 3
#   puts ">> That's not enough lines."
# end
#
# number_lines.times { puts 'Launch School is the best!' }

## Question 6

# USER_PASS = 'SecreT'
#
# loop do
#   puts '>> Please enter your password:'
#   password = gets.chomp
#   break if password == USER_PASS
#   puts '>> Invalid password!'
# end
#
# puts "Welcome!"

## Question 7

# USER_NAME = 'admin'
# USER_PASS = 'SecreT'
#
# loop do
#   puts '>> Please enter your user name:'
#   username = gets.chomp
#   puts '>> Please enter your password:'
#   password = gets.chomp
#   break if username == USER_NAME && password == USER_PASS
#   puts '>> Authorization failed!'
# end
#
# puts 'Welcome!'

## Question 8

# def valid_number?(number_string)
#   number_string.to_i.to_s == number_string
# end
#
# numerator = nil
# denominator = nil
#
# loop do
#   puts '>> Please enter the numerator:'
#   numerator = gets.chomp
#   break if valid_number?(numerator)
#   puts '>> Invalid input. Only integers are allowed.'
# end
#
# denominator = nil
# loop do
#   puts '>> Please enter the denominator:'
#   denominator = gets.chomp
#   if denominator == '0'
#     puts '>> Invalid input. A denominator of 0 is not allowed.'
#   else
#     break if valid_number?(denominator)
#     puts '>> Invalid input. Only integers are allowed.'
#   end
# end
#
# puts ">> #{numerator} / #{denominator} is #{numerator.to_i / denominator.to_i}"

## Question 9

# number_of_lines = nil
#
# loop do
#   puts '>> How many output lines do you want? Enter a number >= 3 (Q to Quit):'
#   input = gets.chomp.downcase
#   number_of_lines = input.to_i
#   break if input == 'q'
#
#   if number_of_lines < 3
#     puts ">> That's not enough lines."
#   elsif number_of_lines >= 3
#     while number_of_lines > 0
#       puts 'Launch School is the best!'
#       number_of_lines -= 1
#     end
#   end
# end

## Question 10

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

first_input = nil
second_input = nil

loop do
  puts '>> Please enter a positive or negative integer:'
  first_input = gets.chomp
  puts '>> Please enter a positive or negative integer:'
  second_input = gets.chomp

  if first_input == '0' || second_input == '0'
    puts '>> Invalid input. Only non-zero integers are allowed.'
    next
  end

  first_int = first_input.to_i
  second_int = second_input.to_i

  if first_int > 0 && second_int > 0 || first_int < 0 && second_int < 0
    puts '>> Sorry. One integer must be positive, one must be negative.'
    puts '>> Please start over.'
    next
  end

  break if valid_number?(first_input) && valid_number?(second_input)

  puts '>> Invalid input. Only non-zero integers are allowed.'
end

sum = first_input.to_i + second_input.to_i

puts "#{first_input} + #{second_input} = #{sum}"
