## Exercise 1

# class Machine
#   def start
#     flip_switch(:on)
#   end
#
#   def stop
#     flip_switch(:off)
#   end
#
#   private
#
#   attr_writer :switch
#
#   def flip_switch(desired_state)
#     self.switch = desired_state
#   end
# end
#
# bob = Machine.new
# p bob.start
# p bob.stop
# p bob.stop

## Exercise 2

# class FixedArray
#   def initialize(length)
#     @array = Array.new(length)
#   end
#
#   def [](index)
#     @array.fetch(index)
#   end
#
#   def []=(index, value)
#     @array.fetch(index)
#     @array[index] = value
#   end
#
#   def to_a
#     @array.clone
#   end
#
#   def to_s
#     @array.clone.to_s
#   end
#
# end
#
# fixed_array = FixedArray.new(5)
# puts fixed_array[3] == nil
# puts fixed_array.to_a == [nil] * 5
#
# fixed_array[3] = 'a'
# puts fixed_array[3] == 'a'
# puts fixed_array.to_a == [nil, nil, nil, 'a', nil]
#
# fixed_array[1] = 'b'
# puts fixed_array[1] == 'b'
# puts fixed_array.to_a == [nil, 'b', nil, 'a', nil]
#
# fixed_array[1] = 'c'
# puts fixed_array[1] == 'c'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', nil]
#
# fixed_array[4] = 'd'
# puts fixed_array[4] == 'd'
# puts fixed_array.to_a == [nil, 'c', nil, 'a', 'd']
# puts fixed_array.to_s == '[nil, "c", nil, "a", "d"]'
#
# puts fixed_array[-1] == 'd'
# puts fixed_array[-4] == 'c'
#
# begin
#   fixed_array[6]
#   puts false
# rescue IndexError
#   puts true
# end
#
# begin
#   fixed_array[-7] = 3
#   puts false
# rescue IndexError
#   puts true
# end

## Exercise 2

# class Student
#   def initialize(name, year)
#     @name = name
#     @year = year
#   end
# end
#
# class Graduate < Student
#   def initialize(name, year, parking)
#     super(name, year)
#     @parking = parking
#   end
# end
#
# class Undergraduate < Student
# end

## Exercise 3
