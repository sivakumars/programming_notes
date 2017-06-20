system 'clear'

## Excercise 1

# class Device
#   def initialize
#     @recordings = []
#   end
#
#   def record(recording)
#     @recordings << recording
#   end
#
#   def listen
#     record(yield) if block_given?
#   end
#
#   def play
#     puts @recordings.last
#   end
# end
#
# listener = Device.new
# listener.listen { "Hello World!" }
# listener.listen
# listener.play

## Exercise 2

# class TextAnalyzer
#   def process
#     yield(File.read("exercises/test.txt"))
#   end
# end
#
# analyzer = TextAnalyzer.new
#
# analyzer.process { |file| puts "#{file.split("\n\n").count} paragraphs" }
# analyzer.process { |file| puts "#{file.lines.count} lines" }
# analyzer.process { |file| puts "#{file.split.count} words" }
# analyzer.process { |file| puts "#{file.length} characters" }

## Exercise 3

# items = ['apples', 'corn', 'cabbage', 'wheat']
#
# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "Let's start gathering food."
# end
#
# gather(items) do |produce|
#   puts produce.join('; ')
# end

## Exercise 4

# birds = %w(raven finch hawk eagle)
#
# def categorize(array)
#   yield(array)
# end
#
# categorize(birds) do |_,_,*birds_of_prey|
#   p birds_of_prey
# end

## Exercise 5

# items = ['apples', 'corn', 'cabbage', 'wheat']
#
# def gather(items)
#   puts "Let's start gathering food."
#   yield(items)
#   puts "We've finished gathering!"
# end
#
# gather(items) do |*first_batch, last_item|
#   puts first_batch.join(", ")
#   puts last_item
# end
#
# gather(items) do |first_item, *middle_batch, last_item|
#   puts first_item
#   puts middle_batch.join(", ")
#   puts last_item
# end
#
# gather(items) do |first_item, *last_batch|
#   puts first_item
#   puts last_batch.join(", ")
# end
#
# gather(items) do |first, second, third, last|
#   puts "#{first}, #{second}, #{third}, and #{last}"
# end

## Exercise 6

# Group 1
# my_proc = proc { |thing| puts "This is a #{thing}." }
# puts my_proc
# puts my_proc.class
# my_proc.call
# my_proc.call('cat')

# Observations:
# - Allows you to store a "chunk of code" to execute later.
# - The syntax is similar to an implicit block except you prepend
# the block with a "proc" instead of a method call, as done for
# calling a method with an implicit block.
# - The proc gets stored as a Proc object. You can execute the code
# in the block using the "call" method on the Proc object.
# - You can call it with no arguments and it looks like it just passes nil.
# - If you call with an argument, it passes to the block as an argument.

# Group 2
# my_lambda = lambda { |thing| puts "This is a #{thing}" }
# my_second_lambda = -> (thing) { puts "This is a #{thing}" }
# puts my_lambda
# puts my_second_lambda
# puts my_lambda.class
# my_lambda.call('dog')
# my_second_lambda.call('dog')
# my_second_lambda.call
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }

# Observations:
# - It's declared similar to a proc. The only difference is you prepend
# "lambda" instead of "proc".
# - It's also a Proc object but it's a special type of Proc object.
# - Unlike with a proc, you can't call with no argument if the lambda takes
# an argument.
# - There is another way to assign a lambda using an arrow (->)
# - You cannot create a Lambda object, probably because it's a type of Proc
# object.

# Group 3
# def block_method_1(animal)
#   yield
# end
#
# block_method_1('seal') { |seal| puts "This is a #{seal}."}
# block_method_1('seal')

# Observations:
# - Similar to a proc, you can call an implicit block with no arguemnt and
# it passes a nil.

# Group 4
# def block_method_2(animal)
#   yield(animal)
# end
#
# block_method_2('turtle') { |turtle| puts "This is a #{turtle}."}
# block_method_2('turtle') do |turtle, seal|
#   puts "This is a #{turtle} and a #{seal}."
# end
# block_method_2('turtle') { puts "This is a #{animal}."}

# Observations:
# - You must pass every argument when you yield a block to use those
# arguments in the block.
# - To pass an argument to a block, you have to use the | | to declare
# a block argument. It's simlar to all blocks.

# Final Analysis:
# - Implicit Blocks and Procs are similiar. The difference is that with a
# proc, you can store a block and call it for execution later.
# - It feels like you'd use a proc more in procedural programming. If you're
# using OOP, why not take advantage of implicit blocks.
# - Another thing! The implicit block lets you define the chunk of code when you
# call the method whereas a proc/lambda makes you do it earlier.
# - Unlike a proc, lambdas force you to specify the exact number of block args.
# - Blcoks also don't enforce the number of arguments passed in.

## Exercise 7

# Group 1
# def check_return_with_proc
#   my_proc = proc { return }
#   my_proc.call
#   puts "This will never output to screen."
# end
#
# check_return_with_proc

# Observations:
# - When a proc is called within a method, the return value of the block
# affects the return value of the method.
# - In this example, since a "return" was called in the block, the method
# stops execution and returns the value passed to the "return" call which was nil.

# Group 2
# my_proc = proc { return }
#
# def check_return_with_proc_2(my_proc)
#   my_proc.call
# end
#
# check_return_with_proc_2(my_proc)

# Observations:
# - Proc objects do not follow normal scoping rules. You must assign the proc
# within the scope that you're going to call it, in this case, within the method.
# - Or maybe you just can't pass a proc as a method argument. I guess that's
# what implicit blocks are for.

# Group 3
# def check_return_with_lambda
#   my_lambda = lambda { return }
#   my_lambda.call
#   puts "This will be output to screen."
# end
#
# check_return_with_lambda

# Observations:
# - Lambdas behave differently. THey don't pass the return value of the block
# to the outer scope (i.e. method) like a normal proc did.

# Group 4
# my_lambda = lambda { return }
# def check_return_with_lambda(my_lambda)
#   my_lambda.call
#   puts "This will be output to screen."
# end
#
# check_return_with_lambda(my_lambda)

# Observations:
# - Unlike a normal proc, a lambda can be passed into a method as an argument.
# - So you can use a lambda like you would a block and determine the block
# behavior when you call the method.

# Group 5
# def block_method_3
#   yield
# end
#
# block_method_3 { return }

# Observations:
# - I'm not sure what happened except that it didn't like that we called return
# in the block.

# Final Analysis:
# - Procs and blocks behave similarly in that you can't return from them if they're
# defined outside your current method. They can't jump back into the method after
# they've yielded to or called a block.
# - If you try to return from within a proc defined within a method, the method
# stops execution immediately and exits.
# - Lambdas allow you to jump around. They return to the place they jumped from.

## Exercise 8

# def convert_to_base_8(n)
#   n.to_s(8).to_i
# end
#
# # The correct type of argument must be used below
# base8_proc = method(:convert_to_base_8).to_proc
#
# # We'll need a Proc object to make this code work. Replace `a_proc`
# # with the correct object
# p [8,10,12,14,16,33].map(&base8_proc)
#
# # You can store a method call as a proc using symbol notation and call it later.
# # You can apply the & operator to an object that is a method. Method#to_proc is called.

## Exercise 9

# def factorial(num)
#   return 1 if num <= 1
#   (1..num).reduce(:*)
# end
#
# iterator = Enumerator.new do |yielder|
#   num = 0
#   loop do
#     yielder << factorial(num)
#     num += 1
#   end
# end
#
# 7.times { puts iterator.next }
#
# iterator.rewind
#
# iterator.each_with_index do |num, index|
#   break if index == 7
#   puts num
# end

## Exercise 10

# def bubble_sort!(array)
#   loop do
#     index = 0
#     swapped = false
#     1.upto(array.size - 1) do |idx|
#
#       condition = block_given? ? !yield(array[idx-1], array[idx]) : array[idx] < array[idx-1]
#
#       if condition
#         array[idx-1], array[idx] = array[idx], array[idx-1]
#         swapped = true
#       end
#
#     end
#     break unless swapped
#   end
#   nil
# end
#
# array = [5, 3]
# bubble_sort!(array)
# p array
# p array == [3, 5]
#
# array = [5, 3, 7]
# bubble_sort!(array) { |first, second| first >= second }
# p array
# p array == [7, 5, 3]
#
# array = [6, 2, 7, 1, 4]
# bubble_sort!(array)
# p array
# p array == [1, 2, 4, 6, 7]
#
# array = [6, 12, 27, 22, 14]
# bubble_sort!(array) { |first, second| (first % 7) <= (second % 7) }
# p array
# p array == [14, 22, 12, 6, 27]
#
# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array)
# p array == %w(Kim Pete Tyler alice bonnie rachel sue)
#
# array = %w(sue Pete alice Tyler rachel Kim bonnie)
# bubble_sort!(array) { |first, second| first.downcase <= second.downcase }
# p array == %w(alice bonnie Kim Pete rachel sue Tyler)
