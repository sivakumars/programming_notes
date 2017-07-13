system 'clear'

## Exercise 1

# def step(start_point, end_point, increment)
#   while start_point <= end_point
#     yield(start_point)
#     start_point += increment
#   end
# end
#
# step(1, 10, 3) { |value| puts "value = #{value}" }

## Exercise 2

# def zip(arr1, arr2)
#   result = []
#   index = 0
#   while index < arr1.size
#       result << [arr1[index], arr2[index]]
#       index += 1
#   end
#   result
# end
#
# p zip([1, 2, 3], [4, 5, 6])

## Exercise 3

# def map(collection)
#   transformed_collection = []
#   collection.each do |item|
#     transformed_collection << yield(item)
#   end
#   transformed_collection
# end
#
# p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
# p map([]) { |value| true } == []
# p map(['a', 'b', 'c', 'd']) { |value| false } == [false, false, false, false]
# p map(['a', 'b', 'c', 'd']) { |value| value.upcase } == ['A', 'B', 'C', 'D']
# p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]

## Exercise 4

# def count(*args)
#   counter = 0
#   args.each do |item|
#     counter += 1 if yield(item)
#   end
#   counter
# end
#
# p count(1, 3, 6) { |value| value.odd? } == 2
# p count(1, 3, 6) { |value| value.even? } == 1
# p count(1, 3, 6) { |value| value > 6 } == 0
# p count(1, 3, 6) { |value| true } == 3
# p count() { |value| true } == 0
# p count(1, 3, 6) { |value| value - 6 } == 3

## Exercise 5

# def drop_while(array)
#   index = 0
#
#   loop do
#     break if !yield(array[index]) || index == array.size
#     index += 1
#   end
#
#   array[index..-1]
# end
#
# p drop_while([1, 3, 5, 6]) { |value| value.odd? } == [6]
# p drop_while([1, 3, 5, 6]) { |value| value.even? } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| true } == []
# p drop_while([1, 3, 5, 6]) { |value| false } == [1, 3, 5, 6]
# p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
# p drop_while([]) { |value| true } == []

## Exercise 6

# def each_with_index(array)
#   index = 0
#   array.each do |item|
#     yield(item, index)
#     index += 1
#   end
# end
#
# result = each_with_index([1, 3, 6]) do |value, index|
#   puts "#{index} -> #{value**index}"
# end
#
# puts result == [1, 3, 6]

## Exercise 7

# def each_with_object(array, obj)
#   array.each do |item|
#     yield(item, obj)
#   end
#   obj
# end
#
# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << value**2
# end
# p result == [1, 9, 25]
#
# result = each_with_object([1, 3, 5], []) do |value, list|
#   list << (1..value).to_a
# end
# p result == [[1], [1, 2, 3], [1, 2, 3, 4, 5]]
#
# result = each_with_object([1, 3, 5], {}) do |value, hash|
#   hash[value] = value**2
# end
# p result == { 1 => 1, 3 => 9, 5 => 25 }
#
# result = each_with_object([], {}) do |value, hash|
#   hash[value] = value * 2
# end
# p result == {}

## Exercise 8

# def max_by(array)
#   return nil if array.empty?
#
#   max_element = array.first
#   max_value = yield(max_element)
#
#   array.each do |item|
#     yielded_value = yield(item)
#     if yielded_value > max_value
#       max_value = yielded_value
#       max_element = item
#     end
#   end
#   max_element
# end
#
# p max_by([1, 5, 3]) { |value| value + 2 } == 5
# p max_by([1, 5, 3]) { |value| 9 - value } == 1
# p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
# p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
# p max_by([-7]) { |value| value * 3 } == -7
# p max_by([]) { |value| value + 5 } == nil

## Exercise 9

# def each_cons(array)
#   index = 0
#   while index < array.size - 1
#     yield(array[index], array[index+1])
#     index += 1
#   end
#   nil
# end
#
# hash = {}
# result = each_cons([1, 3, 6, 10]) do |value1, value2|
#   hash[value1] = value2
# end
#
# p result == nil
# p hash == { 1 => 3, 3 => 6, 6 => 10 }
#
# hash = {}
# each_cons([]) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {}
#
# hash = {}
# each_cons(['a', 'b']) do |value1, value2|
#   hash[value1] = value2
# end
# p hash == {'a' => 'b'}

## Exercise 10

# def each_cons(array, n)
#   index = 0
#   while index <= array.size - n
#     elements = array[(index + 1), n - 1]
#     yield(array[index], *elements)
#     index += 1
#   end
# end
#
# hash = {}
# each_cons([1, 3, 6, 10], 1) do |value|
#   hash[value] = true
# end
# p hash
# p hash == { 1 => true, 3 => true, 6 => true, 10 => true }
#
# hash = {}
# each_cons([1, 3, 6, 10], 2) do |value1, value2|
#   hash[value1] = value2
# end
# p hash
# p hash == { 1 => 3, 3 => 6, 6 => 10 }
#
# hash = {}
# each_cons([1, 3, 6, 10], 3) do |value1, *values|
#   hash[value1] = values
# end
# p hash
# p hash == { 1 => [3, 6], 3 => [6, 10] }
#
# hash = {}
# each_cons([1, 3, 6, 10], 4) do |value1, *values|
#   hash[value1] = values
# end
# p hash
# p hash == { 1 => [3, 6, 10] }
#
# hash = {}
# each_cons([1, 3, 6, 10], 5) do |value1, *values|
#   hash[value1] = values
# end
# p hash
p hash == {}
