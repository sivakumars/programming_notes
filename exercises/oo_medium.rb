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

## Exercise 3

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

## Exercise 4

# class CircularQueue
#   def initialize(buffer_size)
#     @buffer_size = buffer_size
#     @queue = []
#   end
#
#   def enqueue(value)
#     dequeue if @queue.size >= @buffer_size
#     @queue.push(value)
#   end
#
#   def dequeue
#     @queue.shift
#   end
# end
#
# queue = CircularQueue.new(3)
# puts queue.dequeue == nil
#
# queue.enqueue(1)
# queue.enqueue(2)
# p queue.dequeue == 1
#
# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2
#
# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil
#
# queue = CircularQueue.new(4)
# puts queue.dequeue == nil
#
# queue.enqueue(1)
# queue.enqueue(2)
# puts queue.dequeue == 1
#
# queue.enqueue(3)
# queue.enqueue(4)
# puts queue.dequeue == 2
#
# queue.enqueue(5)
# queue.enqueue(6)
# queue.enqueue(7)
# puts queue.dequeue == 4
# puts queue.dequeue == 5
# puts queue.dequeue == 6
# puts queue.dequeue == 7
# puts queue.dequeue == nil

## Exercise 5
# class MinilangRuntimeError < RuntimeError; end
# class BadTokenError < MinilangRuntimeError; end
# class EmptyStackError < MinilangRuntimeError; end
#
# class Minilang
#   ACTIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)
#
#   def initialize(program)
#     @program = program
#     @stack = []
#     @register = 0
#   end
#
#   def eval
#     @program.split.each do |token|
#       eval_token(token)
#     end
#   rescue MinilangRuntimeError => error
#     puts error.message
#   end
#
#   private
#
#   def eval_token(token)
#     if ACTIONS.include?(token)
#       send(token.downcase)
#     elsif token == token.to_i.to_s
#       @register = token.to_i
#     else
#       raise BadTokenError, "Invalid token: #{token}"
#     end
#   end
#
#   def push
#     @stack.push(@register)
#   end
#
#   def pop
#     raise EmptyStackError, "Empty stack!" if @stack.empty?
#     @register = @stack.pop
#   end
#
#   def add
#     @register += pop
#   end
#
#   def sub
#     @register -= pop
#   end
#
#   def mult
#     @register *= pop
#   end
#
#   def div
#     @register /= pop
#   end
#
#   def mod
#     @register %= pop
#   end
#
#   def print
#     puts @register
#   end
# end
#
# Minilang.new('PRINT').eval
# Minilang.new('5 PUSH 3 MULT PRINT').eval
# Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# Minilang.new('5 PUSH POP POP PRINT').eval
# Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Minilang.new('-3 PUSH 5 SUB PRINT').eval
# Minilang.new('6 PUSH').eval

## Exercise 6

# - generate a random number between 1 and 100
# - create guesses variable and decrement after each guess
# - Prompt to enter a number
# - check if guess is too high or low and print info
# - run loop until guesses == 0

# class PingGame
#   MAX_GUESSES = 7
#   RANGE = 1..100
#
#   def initialize
#     @guesses_left = MAX_GUESSES
#     @answer = rand(RANGE)
#     @current_guess = nil
#   end
#
#   def play
#     loop do
#       display_prompt
#       check_and_display_results
#       break if correct_guess? || no_guesses_left?
#     end
#     display_losing_result unless correct_guess?
#   end
#
#   def display_prompt
#     puts ""
#     puts "You have #{@guesses_left} guesses remaining."
#     loop do
#       print "Enter a number between 1 and 100: "
#       @current_guess = gets.chomp.to_i
#       break if (1..100).include?(@current_guess)
#       print "Invalid guess. "
#     end
#     decrement_guess_counter
#   end
#
#   def check_and_display_results
#     if @current_guess < @answer
#       puts "Your guess is too low"
#     elsif @current_guess > @answer
#       puts "Your guess is too high"
#     else
#       puts "You win!"
#     end
#   end
#
#   def correct_guess?
#     @current_guess == @answer
#   end
#
#   def no_guesses_left?
#     @guesses_left < 1
#   end
#
#   def display_losing_result
#     puts "You are out of guesses. You lose."
#   end
#
#   def decrement_guess_counter
#     @guesses_left -= 1
#   end
# end
#
# PingGame.new.play

## Exercise 7

# class Guesser
#   MAX_GUESSES = 7
#
#   def initialize(low, high)
#     @low = low
#     @high = high
#     @answer = rand(low..high)
#     @guesses_left = Math.log2(high - low + 1).to_i + 1
#     @current_guess = nil
#   end
#
#   def play
#     loop do
#       display_prompt
#       check_and_display_results
#       break if correct_guess? || no_guesses_left?
#     end
#     display_losing_result unless correct_guess?
#   end
#
#   def display_prompt
#     puts ""
#     puts "You have #{@guesses_left} guesses remaining."
#     loop do
#       print "Enter a number between #{@low} and #{@high}: "
#       @current_guess = gets.chomp.to_i
#       break if (@low..@high).include?(@current_guess)
#       print "Invalid guess. "
#     end
#     decrement_guess_counter
#   end
#
#   def check_and_display_results
#     if @current_guess < @answer
#       puts "Your guess is too low"
#     elsif @current_guess > @answer
#       puts "Your guess is too high"
#     else
#       puts "You win!"
#     end
#   end
#
#   def correct_guess?
#     @current_guess == @answer
#   end
#
#   def no_guesses_left?
#     @guesses_left < 1
#   end
#
#   def display_losing_result
#     puts "You are out of guesses. You lose."
#   end
#
#   def decrement_guess_counter
#     @guesses_left -= 1
#   end
# end
#
# Guesser.new(501, 1500).play

## Exercise 8
