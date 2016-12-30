## Question 1

# loop do
#   puts 'Just keeps printing...'
#   break
# end

## Question 2

# loop do
#   puts 'This is the outer loop.'
#
#   loop do
#     puts 'This is the inner loop.'
#     break
#   end
#
#   break
# end
#
# puts 'This is outside all loops.'

## Question 3

iterations = 1

# loop do
#   puts "Number of iterations = #{iterations}"
#   iterations += 1
#   break if iterations > 5
# end

# loop do
#   puts "Number of iterations = #{iterations}"
#   break if iterations > 4
#   iterations += 1
# end

## Question 4

# loop do
#   puts 'Should I stop looping?'
#   answer = gets.chomp
#   break if answer == 'yes'
# end

## Question 5

# say_hello = true
# count = 1
#
# while say_hello
#   puts 'Hello!'
#   count += 1
#   say_hello = false if count > 5
# end

## Question 6

# numbers = (0..99).to_a
# count = 0
#
# while count < 5
#   puts numbers.sample
#   count += 1
# end

## Question 7

# count = 1
#
# until count > 10
#   puts count
#   count += 1
# end

## Question 8

# numbers = [7, 9, 13, 25, 18]
# count = 0
#
# until count == numbers.size
#   puts numbers[count]
#   count += 1
# end

## Question 9

# for i in 1..100
#   puts i if i.odd?
# end

## Question 10

# friends = ['Sarah', 'John', 'Hannah', 'Dave']
#
# for name in friends
#   puts "Hello, #{name}!"
# end
