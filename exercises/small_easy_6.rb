## Question 1

# SECONDS_PER_MINUTE = 60
# MINUTES_PER_DEGREE = 60
# SECONDS_PER_DEGREE = MINUTES_PER_DEGREE * SECONDS_PER_MINUTE
# DEGREE = "\xC2\xB0"
#
# def dms(angle)
#   # degrees = angle.floor
#   # minutes_and_seconds = (angle - degrees) * MINUTES_PER_DEGREE
#   # minutes = minutes_and_seconds.floor
#   # seconds = ((minutes_and_seconds - minutes) * SECONDS_PER_MINUTE).floor
#
#   total_seconds = (angle * SECONDS_PER_DEGREE).round
#   degrees, remaining_seconds = total_seconds.divmod(SECONDS_PER_DEGREE)
#   minutes, seconds = remaining_seconds.divmod(SECONDS_PER_MINUTE)
#
#   format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
# end
#
# puts dms(30)
# puts dms(76.73)
# puts dms(254.6)
# puts dms(93.034773)
# puts dms(0)
# puts dms(360)

## Question 2

# def remove_vowels(strings)
#   strings.map { |string| string.gsub(/[aeiou]/i, '') }
# end
#
# puts remove_vowels(%w(abcdefghijklmnopqrstuvwxyz)) == %w(bcdfghjklmnpqrstvwxyz)
# puts remove_vowels(%w(green YELLOW black white)) == %w(grn YLLW blck wht)
# puts remove_vowels(%w(ABC AEIOU XYZ)) == ['BC', '', 'XYZ']

## Question 3

# def find_fibonacci_index_by_length(length)
#   index = 1
#   loop do
#     result = fibonacci(index)
#     break if result.to_s.length >= length
#     index += 1
#   end
#   index
# end
#
# def fibonacci(index)
#   return index if index <= 1
#   fibonacci(index-1) + fibonacci(index-2)
# end

# def find_fibonacci_index_by_length(number_digits)
#   first = 1
#   second = 1
#   index = 3
#
#   loop do
#     fibonacci = first + second
#     break if fibonacci.to_s.size >= number_digits
#
#     first = second
#     second = fibonacci
#     index += 1
#   end
#
#   index
# end
#
# puts find_fibonacci_index_by_length(2)
# puts find_fibonacci_index_by_length(10)
# puts find_fibonacci_index_by_length(100)
# puts find_fibonacci_index_by_length(1000)
# puts find_fibonacci_index_by_length(10000)

## Question 4

# def reverse!(array)
#   reversed_array = []
#   while array.size > 0
#     reversed_array << array.pop
#   end
#   array = reversed_array
# end

# def reverse!(array)
#   left_index = 0
#   right_index = -1
#
#   while left_index < (array.size / 2)
#     array[left_index], array[right_index] = array[right_index], array[left_index]
#     left_index += 1
#     right_index -= 1
#   end
#
#   array
# end
#
# list = %w(a b c d e)
# reverse!(list)
# p list
#
# list = ['abc']
# reverse!(list)
# p list
#
# list = []
# reverse!([])
# p list


## Question 5

# def reverse(array)
#   reversed_array = []
#   index = -1
#   while index > (-array.size - 1)
#     reversed_array << array[index]
#     index -= 1
#   end
#   reversed_array
# end
#
# p reverse([1,2,3,4])
# p reverse(%w(a b c d e))
# p reverse(['abc'])
# p reverse([])
#
# p list = [1, 2, 3]
# p new_list = reverse(list)
# p list.object_id != new_list.object_id
# p list == [1, 2, 3]
# p new_list == [3, 2, 1]

## Question 6

# def merge(array1, array2)
#   (array1 + array2).uniq
# end
#
# p merge([1, 3, 5], [3, 6, 9]) == [1, 3, 5, 6, 9]

## Question 7

# Input:
# - array
# - what happens if input array is empty or not an array
# Output:
# - 2 arrays, 1st array = 1st half of array, 2nd array = 2nd half
# - If input array has odd # elements, middle element in 1st array
# - should the final arrays be printed or returned.
# Model the problem:
# - with even number of elements, example: [1 2 3 4]
#   - divide size in half to determine how many times to select
#   - subtract 1 if you're zero-indexing your counter
#   - delete the vaules and return the original array as the 2nd array
# - with odd number, example: [1 2 3 4 5]
#   - divide size by 2 and round. should work for odd too.

# def halvsies(input_array)
#   first_half_endpoint = (input_array.size / 2.0).ceil
#
#   first_half = []
#   index = 0
#   while index < first_half_endpoint
#     first_half << input_array[index]
#     index += 1
#   end
#
#   second_half = input_array - first_half
#   [first_half, second_half]
# end
#
# p halvsies([1, 2, 3, 4])
# p halvsies([1, 5, 2, 4, 3])
# p halvsies([5])
# p halvsies([])

## Question 8

# Input: unordered array with exactly 1 value occurring twice
# Output: value of the number that appears twice
# Rules: write a method
# Questions:
# - what if the array has 0 or 1 elements?
# - what if the array has 2 elements? should it return that element or error?
# Models:
# (1) iterate through each element of array and iterate through remaining
# elements to see if there are any matches
# (2) iterate through array and set count for each element
# (3) pop the last value of an array and then see if the resulting array contains the value
# (4) sort the array and then iterate until one value equals the previous value

# def find_dup(numbers)
#   while numbers.size > 1
#     number = numbers.pop
#     return number if numbers.include?(number)
#   end
# end
#
# puts find_dup([1, 5, 3, 1])
# puts find_dup([18,  9, 36, 96, 31, 19, 54, 75, 42, 15,
#           38, 25, 97, 92, 46, 69, 91, 59, 53, 27,
#           14, 61, 90, 81,  8, 63, 95, 99, 30, 65,
#           78, 76, 48, 16, 93, 77, 52, 49, 37, 29,
#           89, 10, 84,  1, 47, 68, 12, 33, 86, 60,
#           41, 44, 83, 35, 94, 73, 98,  3, 64, 82,
#           55, 79, 80, 21, 39, 72, 13, 50,  6, 70,
#           85, 87, 51, 17, 66, 20, 28, 26,  2, 22,
#           40, 23, 71, 62, 73, 32, 43, 24,  4, 56,
#           7,  34, 57, 74, 45, 11, 88, 67,  5, 58])

## Question 9

# Input: array and value
# Output: boolean
# Rules: write a method named include?, takes 2 arguments, return true
# if value exists in the given array. otherwise false. don't use include method,
#   must support empty arrays and nil values
# Model:
# - iterate through array and see if any element == value. if there is a match, exit
# loop and return true. else false.

# def include?(array, search_value)
#   array.each do |element|
#     return true if element == search_value
#   end
#   false
# end
#
# puts include?([1,2,3,4,5], 3)
# puts include?([1,2,3,4,5], 6)
# puts include?([], 3)
# puts include?([nil], nil)
# puts include?([], nil)

## Question 10

# Input: positive integer, n
# Output: right triangle with sides of n stars, hypotenuse should run
# from lower left to upper right. The triangle should be filled in with stars.
# Model: print n lines
# - 1st line: print (n-1) spaces + 1 asterisk (*)
# - 2nd line: print (n-2) spaces + 2 asterisks
# ...
# - nth line: print n-n spaces + n asterisks

# def triangle(n)
#   line_number = 1
#   n.times do
#     puts ' ' * (n - line_number) + '*' * line_number
#     line_number += 1
#   end
# end
#
# triangle(5)
# triangle(9)
