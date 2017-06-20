## Exercise 1

# NOUNS = %w(pig horse chicken duck human).freeze
# ADVERBS = %w(quietly aggressively lustfully softly).freeze
# ADJECTIVES = %w(bushy spiky gigantic).freeze
# VERBS = %w(grabs destroys spins).freeze
#
# text = File.read("madlibs.txt")
# madlib = text.split.map do |word|
#   case word
#   when '[noun]'
#     NOUNS.sample
#   when '[adverb]'
#     ADVERBS.sample
#   when '[adjective]'
#     ADJECTIVES.sample
#   when '[verb]'
#     VERBS.sample
#   else
#     word
#   end
# end
#
# p madlib.join(' ')

## Exercise 2
# def star(grid_size)
#   max_distance = (grid_size / 2) - 1
#   0.upto(max_distance) do |spaces_before|
#     spaces_after = max_distance - spaces_before
#     puts ' ' * spaces_before + '*' + ' ' * spaces_after + '*' + ' ' * spaces_after + '*' + ' ' * spaces_before
#   end
#
#   puts '*' * grid_size
#
#   max_distance.downto(0) do |spaces_before|
#     spaces_after = max_distance - spaces_before
#     puts ' ' * spaces_before + '*' + ' ' * spaces_after + '*' + ' ' * spaces_after + '*' + ' ' * spaces_before
#   end
#
# end
#
# star(15)

## Exercise 3

# def transpose(matrix)
#   length = matrix.size - 1
#   result = Array.new(length) { Array.new(length) }
#   0.upto(length)) do |column_index|
#     0.upto(length) do |row_index|
#       result[column_index][row_index] = matrix[row_index][column_index]
#     end
#   end
#   result
# end
#
# matrix = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
#
# new_matrix = transpose(matrix)
#
# p new_matrix == [[1, 4, 3], [5, 7, 9], [8, 2, 6]]
# p matrix == [[1, 5, 8], [4, 7, 2], [3, 9, 6]]

## Exercise 4

# def transpose(matrix)
#   rows = matrix.size
#   cols = matrix.first.size
#   result = Array.new(cols) { Array.new(rows) }
#   (0...cols).each do |column_index|
#     (0...rows).each do |row_index|
#       result[column_index][row_index] = matrix[row_index][column_index]
#     end
#   end
#   result
# end
#
# puts transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
# puts transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
# puts transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
#   [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
# puts transpose([[1]]) == [[1]]

## Exercise 5

# def rotate90(matrix)
#   matrix.transpose.map { |row| row.reverse }
# end
#
# matrix1 = [
#   [1, 5, 8],
#   [4, 7, 2],
#   [3, 9, 6]
# ]
#
# matrix2 = [
#   [3, 7, 4, 2],
#   [5, 1, 0, 8]
# ]
#
# new_matrix1 = rotate90(matrix1)
# new_matrix2 = rotate90(matrix2)
# new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))
#
# p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
# p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
# p new_matrix3 == matrix2

## Exercise 6

# def permutations(array)
#   results = []
#   if array.size == 3
#     results = [array]
#     results << array.reverse
#     results << array.rotate
#     results << array.rotate.reverse
#     results << array.rotate.rotate
#     results << array.rotate.rotate.reverse
#   else
#     permutations(array[1..-1]).each do |permutation|
#       results << [array[0]] + permutation
#     end
#   end
# end


# def permutations(array)
#   return [array] if array.size == 1
#
#   result = []
#   array.each_with_index do |element, index|
#     sub_array = array[0...index] + array[(index + 1)..-1]
#     sub_permutations = permutations(sub_array)
#     sub_permutations.each do |permutation|
#       result << [element] + permutation
#     end
#   end
#   result
# end
#
# p permutations([1, 2, 3, 4])

## Exercise 7

# def my_method(array)
#   if array.empty?
#     []
#   elsif array.size > 1
#     array.map do |value|
#       value * value
#     end
#   else
#     [7 * array.first]
#   end
# end
#
# p my_method([])
# p my_method([3])
# p my_method([3, 4])
# p my_method([5, 6, 7])

## Exercise 8

# def merge(array1, array2)
#   result = []
#   index1 = 0
#   index2 = 0
#
#   loop do
#     if index2 == array2.size
#       result << array1[index1]
#       index1 += 1
#     elsif index1 == array1.size
#       result << array2[index2]
#       index2 += 1
#     elsif array1[index1] <= array2[index2]
#       result << array1[index1]
#       index1 += 1
#     else
#       result << array2[index2]
#       index2 += 1
#     end
#     break if index1 == array1.size && index2 == array2.size
#   end
#
#   result
# end

# p merge([1, 5, 9], [2, 6, 8])
# p merge([1, 1, 3], [2, 2])
# p merge([], [1, 4, 5])
# p merge([1, 4, 5], [])

## Exercise 9

# def merge_sort(array)
#   return array if array.size == 1
#   center = array.size/2
#   merge(merge_sort(array[0...center]), merge_sort(array[center..-1]))
# end
#
# p merge_sort([5, 3])
# p merge_sort([9, 5, 7, 1])
# p merge_sort([6, 2, 7, 1, 4])
# p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46])

## Exercise 10

# def egyptian(target_value)
#   denominators = []
#
#   unit_denominator = 1
#   until target_value < 1
#     target_value -= Rational(1, unit_denominator)
#     denominators << unit_denominator
#     unit_denominator += 1
#   end
#
#   while target_value > 0
#     possible_denominator = if target_value.denominator % target_value.numerator == 0
#                              target_value.denominator
#                            else
#                              target_value.denominator / target_value.numerator + 1
#                            end
#
#     while denominators.include?(possible_denominator)
#       possible_denominator += 1
#     end
#
#     target_value -= Rational(1, possible_denominator)
#     denominators << possible_denominator
#   end
#   denominators
# end
#
#
# p egyptian(Rational(2, 1))    # -> [1, 2, 3, 6]
# p egyptian(Rational(137, 60)) # -> [1, 2, 3, 4, 5]
# p egyptian(Rational(3, 1))
#
# def unegyptian(denominators)
#   result = 0
#   denominators.each do |denominator|
#     result += Rational(1, denominator)
#   end
#   result
# end
#
# puts unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
# puts unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
# puts unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
# puts unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
# puts unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
# puts unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
# puts unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
# puts unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)
