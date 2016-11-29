## Question 1

# Rules:
# - array may have 2 or more elements
# -

# def greetings(full_name, profession)
#   name = full_name.join(' ')
#   "=> Hello, #{name}! Nice to have a " \
#     "#{profession[:title]} #{profession[:occupation]} around."
# end
#
# print greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })

## Question 2

# Input/Output: number
# Rules:
# - if argument is "double number", return input as-is
#   - if length of number.to_s is even && the 1st half of string == 2nd half
#     - 1st half of string are the characters up to str.length - 1
# - else, return 2 * input_number
#
# Data Structure:
# - strings

# def double_number?(number)
#   string_number = number.to_s
#   center = string_number.length / 2
#   return false if string_number.length.odd?
#   return true if string_number[0..(center - 1)] == string_number[center..-1]
# end
#
# def twice(number)
#   if double_number?(number)
#     number
#   else
#     number * 2
#   end
# end
#
# puts twice(37) == 74
# puts twice(44) == 44
# puts twice(334433) == 668866
# puts twice(444) == 888
# puts twice(107) == 214
# puts twice(103103) == 103103
# puts twice(3333) == 3333
# puts twice(7676) == 7676
# puts twice(123_456_789_123_456_789) == 123_456_789_123_456_789
# puts twice(5) == 10

## Question 3

# def negative(number)
#   number <= 0 ? number : -number
# end
#
# puts negative(-5)
# puts negative(-3)
# puts negative(0)

## Question 4
#
# def sequence(number)
#   (1..number).to_a
# end

## Question 5

# Input: string
# Output: true/false
# Rules:
# - return true if all alphabetic letters are uppercase, else false
# - ignore non-alpha characters
#
# Steps:
# - Split string into array of characters
# - Loop through each character
#   - If it matches regex for lowercase letter, return false, else true

# def uppercase?(string)
#   string.each_char do |char|
#     return false if char =~ /[a-z]/
#   end
#   true
# end
#
# puts uppercase?('t') == false
# puts uppercase?('T') == true
# puts uppercase?('Four Score') == false
# puts uppercase?('FOUR SCORE') == true
# puts uppercase?('4SCORE!') == true
# puts uppercase?('') == true

## Question 6

# def word_lengths(words)
#   words.split.map do |word|
#     "#{word} #{word.length}"
#   end
# end
#
# p word_lengths("cow sheep chicken") == ["cow 3", "sheep 5", "chicken 7"]
#
# p word_lengths("baseball hot dogs and apple pie") ==
#   ["baseball 8", "hot 3", "dogs 4", "and 3", "apple 5", "pie 3"]
#
# p word_lengths("It ain't easy, is it?") == ["It 2", "ain't 5", "easy, 5", "is 2", "it? 3"]
#
# p word_lengths("Supercalifragilisticexpialidocious") ==
#   ["Supercalifragilisticexpialidocious 34"]
#
# p word_lengths("") == []

## Question 7

# def swap_name(full_name)
#   first_name, last_name = full_name.split
#   "#{last_name}, #{first_name}"
# end
#
# puts swap_name('Joe Roberts') == 'Roberts, Joe'

## Question 8

# Input: two integers
# Output: array
# Rules:
# - first argument is a positive number and length of output array
# - second argument is first element of output array
# - remaining elements are the first element times the index + 1


# def sequence(count, first_number)
#   result = []
#   1.upto(count) do |num|
#     result << num * first_number
#   end
#   count == 0 ? [] : result
# end
#
# puts sequence(5, 1) == [1, 2, 3, 4, 5]
# puts sequence(4, -7) == [-7, -14, -21, -28]
# puts sequence(3, 0) == [0, 0, 0]
# puts sequence(0, 1000000)

## Question 9

# def get_grade(score1, score2, score3)
#   avg = (score1 + score2 + score3) / 3.0
#   case
#   when avg < 60 then 'F'
#   when avg < 70 then 'D'
#   when avg < 80 then 'C'
#   when avg < 90 then 'B'
#   else               'A'
#   end
# end
#
# puts get_grade(95, 90, 93)
# puts get_grade(50, 50, 95)

## Question 10

# Input: array of arrays; inner array has a string (fruit) and a number (quantity)
# Output: array that repeats fruit based on quantity value in input
# Steps:
#   - map each inner array
#     - take last value in array, use times, and concat first value in array
#   - flatten result of the map

# def buy_fruit(list)
#   list.map do |fruit, quantity|
#     quantity.times.map { fruit }
#   end.flatten
# end

# p buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]])
