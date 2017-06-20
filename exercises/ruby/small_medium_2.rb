## Exercise 1

# SENTENCE_ENDERS = ['.', '!', '?'].freeze
#
# text = File.read("test.txt")
#
# locations = [0]
# text.chars.each_with_index do |char, index|
#   locations << index if SENTENCE_ENDERS.include?(char)
# end
#
# sentences = []
# start_location = 0
# locations.each do |location|
#   sentences << text[start_location..location]
#   start_location = location + 1
# end
#
# word_counts = []
# sentences.each do |sentence|
#   word_counts << sentence.split.length
# end
# longest_sentence = sentences[word_counts.index(word_counts.max)]
# max_length = word_counts.max
#
# puts "#{longest_sentence}"
# puts "Containing #{max_length} words"

# text = File.read("test.txt")
#
# sentences = text.split(/\.|\?|!/)
#
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# number_of_wods = largest_sentence.split.size

# puts "#{longest_sentence}"
# puts "Containing #{max_length} words"

## Exercise 2

# def block_word?(word)
#   blocks = [ ['B', 'O'], ['G', 'T'], ['V', 'I'], ['X', 'K'], ['R', 'E'], ['L', 'Y'], ['D', 'Q'], ['F', 'S'], ['Z', 'M'], ['C', 'P'], ['J', 'W'], ['N', 'A'], ['H', 'U'] ]
#   word.upcase.each_char do |char|
#     if blocks.flatten.include?(char)
#       blocks.each { |block| blocks.delete(block) if block.include?(char) }
#     else
#       return false
#     end
#   end
#   true
# end
#
# puts block_word?('BATCH')
# puts block_word?('BUTCH')
# puts block_word?('jest')

## Exercise 3

# def letter_percentages(string)
#   lower_count = 0
#   upper_count = 0
#   neither_count = 0
#   string.each_char do |char|
#     if char =~ /[a-z]/
#       lower_count += 1
#     elsif char =~ /[A-Z]/
#       upper_count += 1
#     else
#       neither_count += 1
#     end
#   end
#   total = string.length.to_f
#   { lowercase: 100*lower_count/total, uppercase: 100*upper_count/total, neither: 100*neither_count/total }
# end
#
# puts letter_percentages('abCdef 123') == { lowercase: 50, uppercase: 10, neither: 40 }
# puts letter_percentages('AbCd +Ef') == { lowercase: 37.5, uppercase: 37.5, neither: 25 }
# puts letter_percentages('123') == { lowercase: 0, uppercase: 0, neither: 100 }

## Exercise 4

# def balanced?(string)
#   count = 0
#   string.each_char do |char|
#     count += 1 if char == '('
#     count -= 1 if char == ')'
#     return false if count < 0
#   end
#   count == 0
# end
#
# puts balanced?('What (is) this?')
# puts balanced?('What is) this?')
# puts balanced?('What (is this?')
# puts balanced?('((What) (is this))?')
# puts balanced?('((What)) (is this))?')
# puts balanced?('Hey!')
# puts balanced?(')Hey!(')
# puts balanced?('What ((is))) up(')

## Exercise 5

# def valid_triangle?(side1, side2, side3)
#   sides = [side1, side2, side3].sort
#   sides.none? {|side| side <= 0 } && sides[0] + sides[1] > sides[2]
# end
#
# def triangle(side1, side2, side3)
#   case
#   when !valid_triangle?(side1, side2, side3)
#     :invalid
#   when side1 == side2 && side2 == side3
#     :equilateral
#   when side1 == side2 || side2 == side3 || side1 == side3
#     :isosceles
#   else
#     :scalene
#   end
# end
#
# puts triangle(3, 3, 3) == :equilateral
# puts triangle(3, 3, 1.5) == :isosceles
# puts triangle(3, 4, 5) == :scalene
# puts triangle(0, 3, 3) == :invalid
# puts triangle(3, 1, 1) == :invalid

## Exercise 6

# def triangle(ang1, ang2, ang3)
#   angles = [ang1, ang2, ang3]
#   case
#   when (angles.any? { |ang| ang <= 0 } || angles.reduce(:+) != 180)
#     :invalid
#   when (angles.any? { |ang| ang == 90 })
#     :right
#   when (angles.any? { |ang| ang > 90 })
#     :obtuse
#   else
#     :acute
#   end
# end
#
# puts triangle(60, 70, 50)
# puts triangle(30, 90, 60)
# puts triangle(120, 50, 10)
# puts triangle(0, 90, 90)
# puts triangle(50, 50, 50)

## Exercise 7

# require 'date'
#
# def friday_13th?(year)
#   unlucky_count = 0
#   first_day = Date.new(year, 1, 1)
#   last_day = Date.new(year, 12, 31)
#   (first_day..last_day).each do |date|
#     count += 1 if date.friday? && date.day == 13
#   end
#   unlucky_count
# end
#
# puts friday_13th?(2015) == 3
# puts friday_13th?(1986) == 1
# puts friday_13th?(2019) == 2

## Exercise 8

# def featured(number)
#   return "There is no possible number that fulfills those requirements." if number > 9_876_543_210
#   loop do
#     number += 1
#     next if number % 7 != 0
#     next if number.even?
#     next if number.to_s.chars.uniq != number.to_s.chars
#     break
#   end
#   number
# end
#
# puts featured(12) == 21
# puts featured(20) == 21
# puts featured(21) == 35
# puts featured(997) == 1029
# puts featured(1029) == 1043
# puts featured(999_999) == 1_023_547
# puts featured(999_999_987) == 1_023_456_987
# puts featured(9_999_999_999)

## Exercise 9

# require 'pry'
#
# def bubble_sort!(array)
#   loop do
#     swapped = false
#     1.upto(array.size - 1) do |index|
#       if array[index] < array[index - 1]
#         array[index], array[index - 1] = array[index - 1], array[index]
#         swapped = true
#       end
#     end
#     break unless swapped
#   end
#   array
# end
#
# p array = [5, 3]
# bubble_sort!(array)
# p array
#
# p array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array
#
# p array = %w(Sue Pete Alice Tyler Rachel Kim Bonnie)
# bubble_sort!(array)
# p array

## Exercise 10

# def sum_square_difference(n)
#   square_of_sums = (1..n).reduce(:+) ** 2
#   sum_of_squares = (1..n).map{|num| num**2}.reduce(:+)
#   square_of_sums - sum_of_squares
# end
#
# puts sum_square_difference(3) == 22
# puts sum_square_difference(10) == 2640
# puts sum_square_difference(1) == 0
# puts sum_square_difference(100) == 25164150
