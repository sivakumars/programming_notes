# Write a method that will determine whether an integer is a prime. Don't use the Prime class.

def is_prime?(number)
  (2...number).each do |divisor|
    return false if number % divisor == 0
  end
  true
end
#
#
# puts is_prime?(3) # => true
# puts is_prime?(4) # => false

# Write a method that will take an array of numbers and only return those that are prime.

def select_primes(array)
  array.select { |num| is_prime?(num) }
end

p select_primes([1, 2, 3, 4]) # => [1, 2, 3]
p select_primes([4, 6, 8, 10]) # => []
