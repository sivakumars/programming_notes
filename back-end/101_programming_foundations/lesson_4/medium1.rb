## Question 1

# statement = "The Flintstones Rock!"
#
# 10.times { puts statement = " #{statement}" }

## Question 2

# statement = "The Flintstones Rock!"
# results = {}
#
# puts statement.each_char { |char| results[char] = statement.count(char) }

## Question 3

# puts "the value of 40 + 2 is " + (40 + 2)
#
# I think you can only use the "+" to concatenate strings. So if you convert
# the number to a string, it should work.
#
# puts "the value of 40 + 2 is " + (40 + 2).to_s

## Question 4

# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.shift(1)
# end
#
# 1
# 3
#
# numbers = [1, 2, 3, 4]
# numbers.each do |number|
#   p number
#   numbers.pop(1)
# end
#
# 1
# 2
#
# In each case, since a number is removed each iteration, only 1/2 as many iterations (i.e. 2)
# are completed. In the first case, on the 2nd iteration, a 3 is printed because
# during the 1st iteration, the 1 was removed from the array and the 3 is now
# in the 2nd iteration position. In the second case, the numbers are removed
# from the end of the array so 1 and 2 are printed and then the loop ends
# because there are only 2 elements left in the array after 2 iterations so
# there is nothing left to iterate on.

## Question 5

# def factors(number)
#   dividend = number
#   divisors = []
#   while dividend > 0 do
#     divisors << number / dividend if number % dividend == 0
#     dividend -= 1
#   end
#   if divisors.empty?
#     print "Found no factors. Note: this doesn't find factors for 0 or negative numbers."
#   else
#     divisors
#   end
# end
#
# p factors(5)

## Question 6

# The difference is that the input array is permanently modified in the 1st
# implementation. In the 2nd implmentation, the caller can still use the input
# array in its original form.

## Question 7

# limit = 15
#
# def fib(first_num, second_num, limit)
#   while second_num < limit
#     sum = first_num + second_num
#     first_num = second_num
#     second_num = sum
#   end
#   sum
# end
#
# result = fib(0, 1)
# puts "result is #{result}"

## Question 8

# title = "the greatest story never told."
#
# def titalize(title)
#   title_capitalized = []
#   title.split.each do |word|
#     word.capitalize!
#     title_capitalized << word
#   end
#   title_capitalized.join(' ')
# end
#
# p titalize(title)

## Question 9

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# munsters.each do |key, value|
#   case value["age"]
#   when 0..18
#     value["age_group"] = "kid"
#   when 18..65
#     value["age_group"] = "adult"
#   when 66..500
#     value["age_group"] = "senior"
#   else
#     p "That doesn't appear to be an appropriate age."
#   end
# end
#
# p munsters
