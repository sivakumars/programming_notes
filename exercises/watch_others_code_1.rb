# Write a method that will determine whether an integer is a prime. Don't use the Prime class.

# def is_prime?(number)
#   return false if number <= 1
#   (2...number).each do |divisor|
#     return false if number % divisor == 0
#   end
#   true
# end
#
#
# puts is_prime?(3) # => true
# puts is_prime?(4) # => false

# Write a method that will take an array of numbers and only return those that are prime.

# def select_primes(array)
#   array.select { |num| is_prime?(num) }
# end

# p select_primes([1, 2, 3, 4]) # => [2, 3]
# p select_primes([4, 6, 8, 10]) # => []

# Write a method that will take an array of numbers and return the number of primes in the array.

# def count_primes(array)
#   select_primes(array).count
# end
#
# puts count_primes([1, 2, 3, 4]) # => 2
# puts count_primes([4, 6, 8, 10]) # => 0

# Write a program that asks the user to enter an integer greater than 0, then asks if the user wants to determine the sum or product of all numbers between 1 and the entered integer.

# num = 0
# operation = ""
#
# loop do
#   puts ">> Please enter an integer greater than 0:"
#   num = gets.chomp.to_i
#   break if num.to_i > 0
# end
#
# loop do
#   puts ">> Enter 's' to compute sum, 'p' to compute product."
#   operation = gets.chomp
#   break if operation == 's' || operation == 'p'
# end
#
# case operation
# when 's'
#   output = (1..num).reduce(:+)
#   puts "The sum of the integers between 1 and #{num} is #{output}."
# when 'p'
#   output = (1..num).reduce(:*)
#   puts "The product of the integers between 1 and #{num} is #{output}."
# end

# Write a method that combines two Arrays passed in as arguments, and returns a new Array that contains all elements frmo both Array arguments, with the elements taken in alternation.

# You may assume that both input Arrays are non-empty, and that they have the same number of elements.

def interleave(arr1, arr2)
  size = arr1.size
  result = []
  (0...size).each do |index|
    result << arr1[index] << arr2[index]
  end
  result
end

p interleave([1, 2, 3], ['a', 'b', 'c']) # => [1, 'a', 2, 'b', 3, 'c']
