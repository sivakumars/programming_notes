## Question 1
#
# def hello
#   "Hello"
# end
#
# def world
#   "World"
# end
#
# puts "#{hello} #{world}"

## Question 2

# def hello
#   'Hello'
# end
#
# def world
#   'World'
# end
#
# def greet
#   hello + " " + world
# end
#
# puts greet

## Question 3

# def car(make, model)
#   puts "#{make} #{model}"
# end
#
# car('Toyoya', 'Corolla')
#
# def car(make, model)
#   "#{make} #{model}"
# end
#
# puts car('Toyoya', 'Corolla')

## Question 4

# def time_of_day(daylight)
#   if daylight
#     puts "It's daytime!"
#   else
#     puts "It's nighttime!"
#   end
# end
#
# daylight = [true, false].sample
# time_of_day(daylight)

## Question 5

# def dog(name)
#   return name
# end
#
# def cat(name)
#   return name
# end
#
# puts "The dog's name is #{dog('Spot')}."
# puts "The cat's name is #{cat('Ginger')}."

## Question 6

# def assign_name(name = 'Bob')
#   name
# end
#
# puts assign_name == 'Bob'
# puts assign_name('Kevin') == 'Kevin'

## Question 7

# def add(first_input, second_input)
#   first_input + second_input
# end
#
# def multiply(first_input, second_input)
#   first_input * second_input
# end
#
# puts add(2, 2) == 4
# puts add(5, 4) == 9
# puts multiply(add(2, 2), add(5, 4)) == 36

## Question 8

# def name(names)
#   names.sample
# end
#
# def activity(activities)
#   activities.sample
# end
#
# def sentence(name, activity)
#   "#{name} went #{activity} today!"
# end
#
# names = ['Dave', 'Sally', 'George', 'Jessica']
# activities = ['walking', 'running', 'cycling']
#
# puts sentence(name(names), activity(activities))

## Question 9

# def print_me
#   puts "I'm printing within the method!"
# end
#
# print_me

## Question 10
# 
# def print_me
#   "I'm printing the return value!"
# end
#
# puts print_me
