## Question 1

Input: two non-empty and equally sized arrays
Output: one array that contains alternating elements from both arrays
Model:
- create empty output array, one each loop for each array and add elements by
index to the output array

def interleave(array1, array2)
  alternator = []
  index = 0
  while index < array1.size
    alternator << array1[index] << array2[index]
    index += 1
  end
  alternator
end

p interleave([1, 2, 3], ['a', 'b', 'c'])

## Question 2

# Input: string
# Output: hash with 3 keys
#   - lowercase = number of lowercase letters in string
#   - uppercase = number of uppercase letters in string
#   - neither = number of characters that are neither
# Rules: spaces are characters
# Model:
# - use string.count to match uppercase and lowercase characters
# - subtract the sum of those counts from the length of string for neither

# def letter_case_count(string)
#   lowercase = string.count('a-z')
#   uppercase = string.count('A-Z')
#   neither = string.count('^a-zA-Z')
#   { lowercase: lowercase, uppercase: uppercase, neither: neither}
# end
#
# puts letter_case_count('abCdef 123') == { lowercase: 5, uppercase: 1, neither: 4 }
# puts letter_case_count('AbCd +Ef') == { lowercase: 3, uppercase: 3, neither: 2 }
# puts letter_case_count('123') == { lowercase: 0, uppercase: 0, neither: 3 }
# puts letter_case_count('') == { lowercase: 0, uppercase: 0, neither: 0 }

## Question 3

# Input: single string
# Output: new string with same words except every first letter of word is capitalized
# Rules: word = any sequence of non-blank characters, don't touch non letter characters
# Model:
# - Split the string and then iterate through the resulting array.
# - Use capitalize method on each word.
# - Might need to check if first character is a letter and skip capitalize
# - join new array

# def word_cap(string)
#   capitalized_string = string.split.map do |word|
#     word.capitalize
#   end
#   capitalized_string.join(' ')
# end
#
# puts word_cap('four score and seven')
# puts word_cap('the javaScript language')
# puts word_cap('this is a "quoted" word')

## Question 4

# Input: string
# Output: new string with same words but every uppercase letter is lower case and vice versa
# Rules: non-letter characters should be unchanged
# Model:
# - break string into array of characters
# - loop through each character
# - check if it matches upperase or lowercase and do appropriate swap

# def swapcase(words)
#   swapped = []
#   words.each_char do |char|
#     swapped << char.gsub(/[A-Z]/i, '' => char.downcase, 'a-z' => char.upcase)
#   end
#   swapped.join('')
# end

# def swapcase(words)
#   swapped = words.chars.map do |char|
#     if char =~ /[A-Z]/
#       char.downcase
#     elsif char =~ /[a-z]/
#       char.upcase
#     else
#       char
#     end
#   end
#   swapped.join
# end
#
# puts swapcase('CamelCase')
# puts swapcase('Tonight on XYZ-TV')

## Question 5

# Input: string
# Output: string where every other letter is uppercase
# Rules:
# - write method
# - non-letters should not be changed
# - non-letters (including spaces) count though
# Model:
# - iterate through string, if index is even, use upcase on character
# - use map to iterate in place. NO. Can't use map with index.

# def staggered_case(words)
#   staggered = words.chars.map.with_index do |char, index|
#     if index.even?
#       char.upcase
#     else
#       char.downcase
#     end
#   end
#   staggered.join
# end
#
# puts staggered_case('I Love Launch School!')
# puts staggered_case('ALL_CAPS')
# puts staggered_case('ignore 77 the 444 numbers')

## Question 6

# Input: string
# Output: string where every other letter is uppercase, but skip non-alpha
# characters
# Model:
# - iterate through characters, if the letter is in uppers or lowers, upcase
# it. if not, skip it.

# LETTERS = ('A'..'Z').to_a + ('a'..'z').to_a
#
# def staggered_case(words)
#   result = ''
#   needs_upper = true
#
#   words.each_char do |char|
#     if LETTERS.include?(char)
#       if needs_upper
#         result += char.upcase
#       else
#         result += char.downcase
#       end
#       needs_upper = !needs_upper
#     else
#       result += char
#     end
#   end
#   result
# end
#
# puts staggered_case('I Love Launch School!')
# puts staggered_case('ALL CAPS')
# puts staggered_case('ignore 77 the 444 numbers')

## Question 7

# Input: array of integers
# Output: float to 3 decimal places
# Rules:
# - multiply all elements of array
# - divide result by number of entries in array
# - print the result rounded to 3 decimals
# Model:
# - might be able to use a method called mean or average
# - use format or round to display 3 decimal places
# - might need to convert numbers to float

# def show_multiplicative_average(numbers)
#   result = numbers.reduce(:*).to_f / numbers.size
#   puts "The result is #{format("%.3f", result)}"
# end
#
# show_multiplicative_average([3, 5])
# show_multiplicative_average([2, 5, 7, 11, 13, 17])

## Question 8

# Input: two arrays of numbers
# Output: array of numbers
# Rules:
# - each array has same no. of elements
# - output array should place product of elements at each index
# Model:
# - loop through indices from 0 to array1.size
# - output product into new array

# def multiply_list(array1, array2)
#   index = 0
#   products = []
#   while index < array1.size
#     products << array1[index] * array2[index]
#     index +=1
#   end
#   products
# end
#
# def multiply_list(array1, array2)
#   array1.zip(array2).map { |elements| elements.reduce(:*) }
# end
#
# p multiply_list([3, 5, 7], [9, 10, 11])

## Question 9
#
# Input: two arrays of numbers
# Output: array of numbers
# Rules:
# - multiply every element of one array by an element of the other one
# - sort results from smallest to largest
# Model:
# - iterate through each array.

# def multiply_all_pairs(array1, array2)
#   product_pairs = []
#   array1.each do |element1|
#     array2.each do |element2|
#       product_pairs << element1 * element2
#     end
#   end
#   product_pairs.sort
# end
#
# p multiply_all_pairs([2, 4], [4, 3, 1, 2])

## Question 10

# Input: string of words
# Output: string (last word in the string)
# Rules:
# - words are any sequence of non-blank characters
# - input string will always have at least 2 words
# Model:
# - split string into array of words
# - return 2nd to last element in the array

# def penultimate(words)
#   words.split[-2]
# end
#
# puts penultimate('last word')
# puts penultimate('Launch School is great!')
