## Exercise 1

# def rotate_array(array)
#   array[1..-1] << array[0]
# end

# x = [1, 2, 3, 4]
# puts rotate_array(x) == [2, 3, 4, 1]
# puts x == [1, 2, 3, 4]

## Exercise 2

# def rotate_rightmost_digits(number, n)
#   all_digits = number.to_s.chars
#   all_digits[-n..-1] = rotate_array(all_digits[-n..-1])
#   all_digits.join.to_i
# end

# puts rotate_rightmost_digits(735291, 1) == 735291
# puts rotate_rightmost_digits(735291, 2) == 735219
# puts rotate_rightmost_digits(735291, 3) == 735912
# puts rotate_rightmost_digits(735291, 4) == 732915
# puts rotate_rightmost_digits(735291, 5) == 752913
# puts rotate_rightmost_digits(735291, 6) == 352917

## Exercise 3

# def max_rotation(number)
#   number_digits = number.to_s.size
#   while number_digits > 0
#     number = rotate_rightmost_digits(number, number_digits)
#     number_digits -= 1
#   end
#   number
# end
#
# puts max_rotation(735291) == 321579
# puts max_rotation(3) == 3
# puts max_rotation(35) == 53
# puts max_rotation(105) == 15
# puts max_rotation(8_703_529_146) == 7_321_609_845

## Exercise 4

# def on_lights(lights)
#   count = 1
#   lights_on = []
#   lights_off = []
#
#   loop do
#     lights_on << count**2
#     count += 1
#     break if count**2 > lights
#   end
#
#   lights_on
#
#   # 1.upto(lights) do |num|
#   #   lights_off << num unless lights_on.include?(num)
#   # end
#
# end
#
# p on_lights(1000)
# p on_lights(1000).size

## Exercise 5

# def diamond(size)
#   spaces = size / 2
#   stars = 1
#
#   loop do
#     puts ' ' * spaces + '*' * stars + ' ' * spaces
#     spaces -= 1
#     stars += 2
#     break if spaces == 0
#   end
#
#   loop do
#     puts ' ' * spaces + '*' * stars + ' ' * spaces
#     spaces += 1
#     stars -= 2
#     break if stars < 0
#   end
# end
#
# diamond(50)

## Exercise 6

# def minilang(commands)
#   stack = []
#   register = 0
#   commands.split.each do |command|
#     case command
#     when /\d/
#       register = command.to_i
#     when 'PUSH'
#       stack.push(register)
#     when 'ADD'
#       register += stack.pop
#     when 'SUB'
#       register -= stack.pop
#     when 'MULT'
#       register *= stack.pop
#     when 'DIV'
#       register /= stack.pop
#     when 'MOD'
#       register %= stack.pop
#     when 'POP'
#       register = stack.pop
#     when 'PRINT'
#       puts register
#     end
#   end
# end
#
# minilang('PRINT')
# minilang('5 PUSH 3 MULT PRINT')
# minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# minilang('5 PUSH POP PRINT')
# minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# minilang('-3 PUSH 5 SUB PRINT')
# minilang('6 PUSH')
