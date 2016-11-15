## Question 1

# def get_number(label)
#   puts "==> Enter the #{label} number:"
#   number = gets.chomp.to_i
# end
#
# labels = %w(1st 2nd 3rd 4th 5th last)
# numbers = []
#
# labels.each do |label|
#   numbers << get_number(label)
# end
#
# last_number = numbers.pop
#
# if numbers.include?(last_number)
#   puts "The number #{last_number} appears in #{numbers}."
# else
#   puts "The number #{last_number} does not appear in #{numbers}."
# end

## Question 2

# puts "=>> Enter the first number:"
# first_number = gets.chomp.to_i
#
# puts "=>> Enter the second number:"
# second_number = gets.chomp.to_i
#
# sum = first_number + second_number
# minus = first_number - second_number
# product = first_number * second_number
# divisor = first_number / second_number
# remainder = first_number % second_number
# power = first_number ** second_number
#
# results = { '+': sum, '-': minus, '*': product, '/': divisor, '%': remainder, '**': power}
#
# results.each do |operation, result|
#   puts "==> #{first_number} #{operation} #{second_number} = #{result}"
# end

## Question 3

# print "==> Please write word or multiple words: "
# words = gets.chomp.split
#
# number_chars = 0
# words.each { |word| number_chars += word.length }
#
# puts "There are #{number_chars} characters in \"#{input}\"."

## Question 4
#
# def multiply(num1, num2)
#   num1 * num2
# end

# multiply(5, 3) == 15
# p multiply([1, 2], 3)

## Question 5
#
# def power(num, exp)
#   result = num
#   (exp-1).times { result = multiply(result, num) }
#   result
# end
#
# puts power(5, 3)
# puts power(-8, 2)

## Question 6

# def xor?(bool1, bool2)
#   if bool1 && bool2
#     false
#   elsif bool1 || bool2
#     true
#   else
#     false
#   end
# end
#
# puts xor?(5.even?, 4.even?)
# puts xor?(5.odd?, 4.odd?)
# puts xor?(5.odd?, 4.even?)
# puts xor?(5.even?, 4.odd?)

## Question 7

# def oddities(array)
#   odd_elements = []
#   array.each_with_index do |value, index|
#     odd_elements << value if index.even?
#   end
#   odd_elements
# end
#
# p oddities([2, 3, 4, 5, 6])
# p oddities(['abc', 'def'])
# p oddities([123])
# p oddities([])

## Question 8

# def palindrome?(string)
#   string.reverse == string
# end
#
# puts palindrome?('madam')
# puts palindrome?('Madam')
# puts palindrome?("madam i'm adam")
# puts palindrome?('356653')

# def palindrome?(string_or_array)
#   string_or_array.reverse == string_or_array
# end
#
# puts palindrome?('nitin')
# puts palindrome?(%w(n i t i n))

## Question 9

# def real_palindrome?(string)
#   string = string.downcase.delete('^a-z0-9')
#   string.reverse == string
# end
#
# puts real_palindrome?('madam')
# puts real_palindrome?('Madam')
# puts real_palindrome?("Madam, I'm Adam")
# puts real_palindrome?('356653')
# puts real_palindrome?('356a653')
# puts real_palindrome?('123ab321')

## Question 10

# def palindromic_number?(number)
#   number.to_s.reverse == number.to_s
# end
#
# puts palindromic_number?(34543) == true
# puts palindromic_number?(123210) == false
# puts palindromic_number?(22) == true
# puts palindromic_number?(5) == true
