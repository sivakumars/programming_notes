## Exercise 1

# class Vehicle
#   attr_reader :year
#
#   def initialize(year)
#     @year = year
#   end
# end
#
# class Car < Vehicle
#
# end
#
# class Truck < Vehicle
#
# end
#
# truck1 = Truck.new(1994)
# puts truck1.year
#
# car1 = Car.new(2006)
# puts car1.year

## Exercise 2

# class Vehicle
#   attr_reader :year
#
#   def initialize(year)
#     @year = year
#   end
# end
#
# class Truck < Vehicle
#   def initialize(year)
#     super
#     start_engine
#   end
#
#   def start_engine
#     puts 'Ready to go!'
#   end
# end
#
# truck1 = Truck.new(1994)
# puts truck1.year

## Exercise 3

# class Vehicle
#   attr_reader :year
#
#   def initialize(year)
#     @year = year
#   end
# end
#
# class Truck < Vehicle
#   attr_reader :bed_type
#
#   def initialize(year, bed_type)
#     super(year)
#     @bed_type = bed_type
#   end
# end
#
# class Car < Vehicle
# end
#
# truck1 = Truck.new(1994, 'Short')
# puts truck1.year
# puts truck1.bed_type

## Exercise 4

# class Vehicle
#   def start_engine
#     'Ready to go!'
#   end
# end
#
# class Truck < Vehicle
#   def start_engine(speed)
#     super() + " Drive #{speed}, please!"
#   end
# end
#
# truck1 = Truck.new
# puts truck1.start_engine('fast')

## Exercise 5

# module Towable
#   def tow
#     "I can tow a trailer!"
#   end
# end
#
# class Truck
#   include Towable
# end
#
# class Car
# end
#
# truck1 = Truck.new
# puts truck1.tow

## Exercise 6

# module Towable
#   def tow
#     'I can tow a trailer!'
#   end
# end
#
# class Vehicle
#   attr_reader :year
#
#   def initialize(year)
#     @year = year
#   end
#
# end
#
# class Truck < Vehicle
#   include Towable
# end
#
# class Car < Vehicle
# end
#
# truck1 = Truck.new(1994)
# puts truck1.year
# puts truck1.tow
#
# car1 = Car.new(2006)
# puts car1.year

## Exercise 7

# class Animal
#   attr_reader :color
#
#   def initialize(color)
#     @color = color
#   end
# end
#
# class Cat < Animal
# end
#
# class Bird < Animal
# end
#
# puts Cat.ancestors

# Cat
# Animal

## Exercise 8

# class Animal
# end
#
# class Cat < Animal
# end
#
# class Bird < Animal
# end
#
# cat1 = Cat.new
# cat1.color
#
# puts Cat.ancestors

# Cat
# Animal
# Object
# Kernel
# Basic Object

## Exercise 9

# Bird
# Flyable
# Animal

## Exercise 10

# module Transportation
#
#   class Vehicle
#   end
#
#   class Car < Vehicle
#   end
#
#   class Truck < Vehicle
#   end
#
# end
