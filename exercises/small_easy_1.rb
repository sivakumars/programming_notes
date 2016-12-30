## Question 1

# def repeat(statement, number)
#   number.times { puts statement }
# end
#
# repeat('Hello', 3)

## Question 2

# def is_odd?(number)
#   number % 2 == 1
# end
#
# puts is_odd?(2)
# puts is_odd?(5)
# puts is_odd?(-17)
# puts is_odd?(-8)
# puts is_odd?(7.1)
# puts is_odd?(-5.0)

## Question 3

# def digit_list(number)
#   str_array = number.to_s.split('')
#   str_array.map { |str| str.to_i }
# end
#
# puts digit_list(12345) == [1, 2, 3, 4, 5]
# puts digit_list(7) == [7]
# puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
# puts digit_list(444) == [4, 4, 4]

## Question 4

# def count_occurrences(array)
#   array.uniq.each do |element|
#     array_count = array.count(element)
#     puts "#{element} => #{array_count}"
#   end
# end
#
# vehicles = ['car', 'car', 'truck', 'car', 'SUV', 'truck', 'motorcycle', 'motorcycle', 'car', 'truck']
#
# count_occurrences(vehicles)


## Question 5

# def reverse_sentence(string)
#   string.split(' ').reverse.join(' ')
# end
#
# puts reverse_sentence('') == ''
# puts reverse_sentence('Hello World') == 'World Hello'
# puts reverse_sentence('Reverse these words') == 'words these Reverse'

## Question 6

# def reverse_words(string)
#   words = []
#
#   string.split.each do |word|
#     word.reverse! if word.size >= 5
#     words << word
#   end
#
#   words.join(' ')
# end
#
# puts reverse_words('Professional')
# puts reverse_words('Walk around the block')
# puts reverse_words('Launch School')

## Question 7

# def stringy(size)
#   count = 0
#   numbers = []
#
#   loop do
#     if count.even?
#       numbers << 1
#     else
#       numbers << 0
#     end
#     count += 1
#     break if count == size
#   end
#
#   numbers.join
# end
#
# puts stringy(6) == '101010'
# puts stringy(9) == '101010101'
# puts stringy(4) == '1010'
# puts stringy(7) == '1010101'

## Question 8

# def average(numbers)
#   sum = 0
#   numbers.each { |number| sum += number }
#   sum/numbers.size.to_f
# end
#
# puts average([1, 5, 87, 45, 8, 8])
# puts average([9, 47, 23, 95, 16, 52])

## Question 9

# def sum(number)
#   digits = number.to_s.split('').map { |digit| digit.to_i }
#   digits.reduce(:+)
# end
#
# puts sum(23) == 5
# puts sum(496) == 19
# puts sum(123_456_789) == 45

## Question 10

# def calculate_bonus(salary, bonus)
#   bonus ? salary / 2: 0
# end
#
# puts calculate_bonus(2800, true) == 1400
# puts calculate_bonus(1000, false) == 0
# puts calculate_bonus(50000, true) == 25000
