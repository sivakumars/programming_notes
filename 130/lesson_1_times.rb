# def times(number)
#   (0..number-1).each do |n|
#     yield(n)
#   end
#   number
# end
#
# def times(number)
#   counter = 0
#   while counter < number do
#     yield(counter)
#     counter += 1
#   end
#   number
# end
#
# times(5) do |num|
#   puts num
# end

# def each(array)
#   index = 0
#   while index < array.size
#     yield(array[index])
#     index += 1
#   end
#   array
# end
#
# each([1,2,3]) { |element| puts element }

# def select(array)
#   index = 0
#   result = []
#
#   while index < array.size
#     current_element = array[index]
#     result << current_element if yield(current_element)
#     index += 1
#   end
#
#   result
# end
#
# array = [1, 2, 3, 4, 5]
# p select(array) { |num| num.odd? }
# p select(array) { |num| puts num }
# p select(array) { |num| num + 1 }

# def reduce(array, default=0)
#   result = default
#   array.each do |element|
#     result = yield(result, element)
#   end
#   result
# end
#
# array = [1, 2, 3, 4, 5]
#
# p reduce(array) { |acc, num| acc + num }                    # => 15
# p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass
