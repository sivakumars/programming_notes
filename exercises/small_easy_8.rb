## Question 1
#
# Input: array of numbers
# Output: number = sum of the sums of each leading subsequence
# Rules:
# - array always contains > 1 numbers
# - add (0) + (0+1) (0+1+2) + ...
# Model:
# - add first

# def sum_of_sums(numbers)
#   sum_total = 0
#   numbers.each_index do |subset_size|
#     index = 0
#     while index <= subset_size
#       sum_total += numbers[index]
#       index +=1
#     end
#   end
#   sum_total
# end
#
# puts sum_of_sums([3, 5, 2])
# puts sum_of_sums([1, 5, 7, 3])
# puts sum_of_sums([4])
# puts sum_of_sums([1, 2, 3, 4, 5])

## Question 2

# Input: prompt for 4 words
# Output: story
# Rules:
# - ask user for noun, verb, adjective, adverb but don't validate
# Model:
# - Prompt and use string interpolation to display story

# print "Enter a noun: "
# noun = gets.chomp
# print "Enter a verb: "
# verb = gets.chomp
# print "Enter an adjective: "
# adjective = gets.chomp
# print "Enter an adverb: "
# adverb = gets.chomp
#
# puts "Do you #{verb} your #{adjective} #{noun} #{adverb}? That's hilarious!"

## Question 3

# Input: string
# Output: multiple substrings of that string, starting with the first character and
# adding a letter to each substrings until you display the entire string
# Rules:
# - sort from shortest to longest substring
# Model:
# - use upto method to determine length of each substring
# - use slice to grab substring

# def substrings_at_start(string)
#   substrings = []
#   1.upto(string.length) do |substring_length|
#     substrings << string.slice(0, substring_length)
#   end
#   substrings
# end

# p substrings_at_start('abc')
# p substrings_at_start('a')
# p substrings_at_start('xyzzy')

## Question 4

# Input: string
# Output: all substrings of the string
# Rules:
# - sort output by where in string the substring began
# - subsort by length of substring
# Model:
# - use method from previous exercise
# - loop through each char and concatenate to results array

# def substrings(string)
#   result = []
#   0.upto(string.length - 1) do |index|
#     result << substrings_at_start(string[index..-1])
#   end
#   result.flatten
# end

# p substrings('abcde')

## Question 5

# Input: string
# Output: substrings that are palindromes
# Rules:
# - case matters
# - single characters are not palindromes
# Model:
# - use substrings method from previous exercise
# - iterate through results and check if each result is palindrome
# - use string reverse to check if it's equal to string

# def palindrome?(string)
#   string == string.reverse && string.length > 1
# end
#
# def palindromes(string)
#   palindromes = substrings(string).select { |substring| palindrome?(substring) }
# end
#
# p palindromes('abcd')
# p palindromes('madam')
# p palindromes('hello-madam-did-madam-goodbye')
# p palindromes('knitting cassettes')

## Question 6

# Input: 2 numbers
# Output: array of numbers
# Rules:
# - print numbers between range of 2 input numbers
#   - except: if number is divisible by 3, print "Fizz"
#   - except: if number is divisible by 5, print "Buzz"
#   - except: if number is divisible by 3 and 5, print "FizzBuzz"
# Model:
# - Given 1 and 15
#   - check which numbers between 1 and 15 are divisible by 3
#   - check which are divisible by 5
#   - check which are divisible by 15 (3*5)
# - print apporpriate string
#   - model what to print using if conditions
#   - else, print number
#
# Data Structure:
# - Input: create array with numbers between inputs
# - What if second number is greater than first?
# - Use if conditions for print decisions
#
# Steps:
# - Generate array with range of numbers between inputs
# - Map array to string or original number based on what it's divisible by
# - Print the resulting array

# def fizzbuzz(starting_number, ending_number)
#   result = (starting_number..ending_number).map do |number|
#     if number % 15 == 0
#       "FizzBuzz"
#     elsif number % 3 == 0
#       "Fizz"
#     elsif number % 5 == 0
#       "Buzz"
#     else
#       number
#     end
#   end
#   puts result.join(', ')
# end
#
# fizzbuzz(1,15)

## Question 7

# Input: string
# Output: string with every character repeated
# Rules:
# - repeat each character
# - repeat spaces and non-alpha characters
# - preserve case
# Model:
# - Given Hello, print HHeelllloo.
#
# Data Structure:
# - can just use strings to concatenate
#
# Steps:
# - split string into array of characters
# - map new array by concatenating each character twice

# def repeater(string)
#   string.split('').map { |char| char + char }.join
# end

# puts repeater('Hello')
# puts repeater("Good job!")
# puts repeater('')

## Question 8

# def double_consonants(string)
#   string.chars.map do |char|
#     if char =~ /[b-df-hj-np-tv-z]/i
#       char * 2
#     else
#       char
#     end
#   end.join
# end
#
# puts double_consonants('String')
# puts double_consonants("Hello-World!")
# puts double_consonants("July 4th")
# puts double_consonants('')

## Question 9

# Input: number
# Output: number
# Rules:
# - reverse the digits of a number
# - remove trailing zeros
# Model:
# - convert number to string and split into characters(i.e. digits)
# - swap the first digit with the last digits
# - for odd number of digits, leave middle digit alone
#
# Steps:
# - Convert number to string
# - Split string into digit characters
# - Iterate each character and set equal to character same distance away from end of string


# def reversed_number(number)
#   string = number.to_s
#   index = 0
#   while index < string.length / 2
#     string[index], string[-(index+1)]  = string[-(index+1)], string[index]
#     index += 1
#   end
#   string.to_i
# end
#
# puts reversed_number(12345)
# puts reversed_number(12213)
# puts reversed_number(456)
# puts reversed_number(12000)
# puts reversed_number(1)

## Question 10

# Input: string
# Output: 1 or 2 characters
# Rules:
# - input is non-empty
# - if length of string is odd, return middle 1 character
# - if even, return middle 2 characters
# Model:
# - check length of string
# - if odd, return length/2 character
# - else, return length/2 and length/2 - 1 character

# def center_of(string)
#   center_index = string.length / 2
#   center_chars = ''
#   center_chars += string[center_index - 1] if string.length.even?
#   center_chars += string[center_index]
# end
#
# puts center_of('I love ruby')
# puts center_of('Launch School')
# puts center_of('Launch')
# puts center_of('Launchschool')
# puts center_of('x')

## Queen problem

# In the game of chess, a queen can attack pieces which are on the same row,
# column, or diagonal. So if you're told the white queen is at (2, 3) and
# the black queen at (5, 6), then you'd know that you've got a setup
# like so:

# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ W _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ B _
# _ _ _ _ _ _ _ _
# _ _ _ _ _ _ _ _

# You'd also be able to answer whether the queens can attack each other.
# In this cae, the answer would be yes, they can, bcause both pieces
# share a diagonal.

# Input:
#   - chess board displayed in form of a string
#   - the board has underscores for empty chess board spaces and W/B for queen pieces
#   - between the undercores are actual spaces
# Output:
#   - boolean if the 2 pieces can attack each other
# Rules
#   - if pieces can attack each other, return true
#     - share diagonal
#       - the difference between the white queen row and black queen row is the
#       same distance from the white column and black column (absolute value)
#     - have the same column
#       - white queen column number == white queen column number
#     - have the same row
#       - white queen row number == black queen row number
#
# Data Structure:
#   - string representation of board
#   - loop through each line to find row and column number of each piece
#
# Steps:
# - Model:
# -  the coordinates are zero-indexed from top to bottom, left to right
