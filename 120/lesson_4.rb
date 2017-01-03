## EASY 1

## Question 1

# All are objects.

# p true.class
# p "hello".class
# p [1,2,3,"happy days"].class
# p 142.class

## Question 2

# module Speed
#   def go_fast
#     puts "I am a #{self.class.to_s.downcase} and going super fast!"
#   end
# end
#
# class Car
#   include Speed
#
#   def go_slow
#     puts "I am safe and driving slow."
#   end
# end
#
# class Truck
#   include Speed
#
#   def go_very_slow
#     puts "I am a heavy truck and like going very slow."
#   end
# end
#
# car = Car.new
# car.go_fast
# truck = Truck.new
# truck.go_fast

## Question 3

# self references the calling object. Calling "class" on that object returns the
# class, and string interpolation automatically calls "to_s" on the object.

## Question 4

# class AngryCat
#   def hiss
#     puts "Hisssss!!!"
#   end
# end
#
# garfield = AngryCat.new
# puts garfield

## Question 5

# The Fruit class has an instance variable because of the @ sign prepended to the
# assignment of the name variable in the initialize method. The Pizza class
# is simply assigning a local variable.

# class Fruit
#   def initialize(name)
#     name = name
#   end
# end
#
# class Pizza
#   def initialize(name)
#     @name = name
#   end
# end
#
# hot_pizza = Pizza.new("cheese")
# orange    = Fruit.new("apple")
# p hot_pizza
# p orange
# p hot_pizza.instance_variables
# p orange.instance_variables

## Question 6

# class Cube
#   attr_reader :volume
#
#   def initialize(volume)
#     @volume = volume
#   end
# end
#
# allspark = Cube.new(400)
# p allspark.volume

## Question 7

# It will print the class name, object_id, and a list of the instance variables of the object.
# You could find out by consulting finding the documentation for the "to_s"
# method in the Object class.

## Question 8

# "self" refers to the object that called the "make_one_year_older" method.

## Question 9

# "self" prepended to a method name indicates that it's a class method. That means
# it can only be called on the class, not on an instance of the class or object.

## Question 10

# class Bag
#   def initialize(color, material)
#     @color = color
#     @material = material
#   end
# end
#
# grocery_bag = Bag.new("clear", "plastic")
# p grocery_bag

## EASY 2

## Question 1

# class Oracle
#   def predict_the_future
#     "You will " + choices.sample
#   end
#
#   def choices
#     ["eat a nice lunch", "take a nap soon", "stay at work late"]
#   end
# end
#
# oracle = Oracle.new
# oracle.predict_the_future

## Question 2

# It will sample from the choices method in the RoadTrip class, since it exists.
# If that instance method didn't exist, it would look in Oracle, which is
# the superclass of RoadTrip

## Question 3

# p Orange.ancestors # => Orange, Taste, Object, Kernel, BasicObject

## Question 4

# class BeesWax
#   attr_accessor :type
#
#   def initialize(type)
#     @type = type
#   end
#
#   def describe_type
#     puts "I am a #{type} of Bees Wax"
#   end
# end

## Question 5

# local variable, instance variable, class variable

## Question 6

# manufacturer is a class method. You call it on the class --> Television.manufacturer

## Question 7

# It's a class variable. Everytime a new instance of Cat is created, the variable
# increments by 1 (as defined by the initialize method). When you call the
# cats_count method on the class name, you'll obtain the count for the number
# of Cat objects that have been created.

# class Cat
#   @@cats_count = 0
#
#   def initialize(type)
#     @type = type
#     @age  = 0
#     @@cats_count += 1
#   end
#
#   def self.cats_count
#     @@cats_count
#   end
# end
#
# p Cat.cats_count
# garfield = Cat.new("housecat")
# p Cat.cats_count
# scary = Cat.new("tiger")
# p Cat.cats_count

## Question 8

# class Game
#   def play
#     "Start the game!"
#   end
# end
#
# class Bingo < Game
#   def rules_of_play
#     #rules of play
#   end
# end
#
# game_of_bingo = Bingo.new
# p game_of_bingo.play

## Question 9

# The play method in the Game class would never be called by an instance of the
# Bingo class, unless a super method was used within the Bingo class' play
# method.

## Question 10

# It allows you to encapsulate pieces of functionality so you can change things
# in one place and have them apply program-wide. It's fun to model a program-wide
# in this way!

## EASY 3

## Question 1

# 1 --> prints "Hello"
# 2 --> Error: no instance method named bye in the "Hello" lookup chain
# 3 --> Error: missing argument
# 4 --> prints "Goodbye"
# 5 --> Error: no class method named "hi"

## Question 2

# We can create a new method defined as "def self.hi". Or we can add "self" to
# the existing hi method.

## Question 3

# class AngryCat
#   def initialize(age, name)
#     @age  = age
#     @name = name
#   end
#
#   def age
#     puts @age
#   end
#
#   def name
#     puts @name
#   end
#
#   def hiss
#     puts "Hisssss!!!"
#   end
# end
#
# garfield = AngryCat.new(12, "Garfield")
# tiger = AngryCat.new(21, "Chief")

## Question 4

# class Cat
#   attr_reader :type
#
#   def initialize(type)
#     @type = type
#   end
#
#   def to_s
#     "I am a #{type} cat"
#   end
# end
#
# garfield = Cat.new("tabby")
# puts garfield

## Question 5

# The first call would error because there is no instance method called
# manufacturer, only a class method. The second call would work since the
# instance method is called on an instance of the Telvision class.
# The third call would run successfully but not do anything since the
# manufacturer method is empty. The fourth call would throw an error because
# the model method is actually an instance method and needs to be called on an
# instance of the object Television.

# Question 6

# You can just use @age to reassign the instance variable directly rather than
# calling the setter method that is provided by attr_accessor.

## Question 7

# The attr_accesssor creates getter and setter methods but they are never used
# in the class. They do add value because they can be used outside the class.
# Also, the "return" is unnecessary because Ruby automatically returns the value
# of the last line of a method.

## MEDIUM 1

## Question 1

# Ben is right. >= is a method call that runs on a variable. The "balance"
# reference is not a variable here. It's a method that returns a variable via
# the attr_reader, which creates a getter method for balance.

## Question 2

# Line 11 will error becuase there is no setter method defined. The mistake can
# be fixed by adding an attr_accessor for the quantity variable.

## Question 3

# It allows anyone (outside the class) to update the quantity because attr_accessor is defined as
# a public method.

## Question 4

# class Greeting
#   def greet(message)
#     puts message
#   end
# end
#
# class Hello < Greeting
#   def hi
#     greet "Hello"
#   end
# end
#
# class Goodbye < Greeting
#   def bye
#     greet "Goodbye"
#   end
# end
#
# hi = Hello.new
# hi.hi
#
# bye = Goodbye.new
# bye.bye

## Question 5

# class KrispyKreme
#   attr_reader :filling_type, :glazing
#
#   def initialize(filling_type, glazing)
#     @filling_type = filling_type
#     @glazing = glazing
#   end
#
#   def to_s
#     filling_type_print = filling_type ? filling_type : filling_type_print = "Plain"
#     glazing_print = glazing ? " with #{glazing}" : ""
#     filling_type_print + glazing_print
#   end
# end
#
# donut1 = KrispyKreme.new(nil, nil)
# donut2 = KrispyKreme.new("Vanilla", nil)
# donut3 = KrispyKreme.new(nil, "sugar")
# donut4 = KrispyKreme.new(nil, "chocolate sprinkles")
# donut5 = KrispyKreme.new("Custard", "icing")
#
# puts donut1
#   # => "Plain"
#
# puts donut2
#   # => "Vanilla"
#
# puts donut3
#   # => "Plain with sugar"
#
# puts donut4
#   # => "Plain with chocolate sprinkles"
#
# puts donut5
#   # => "Custard with icing"

## Question 6

# In the first example, line 5 directly accesses the @templace instance
# variable, while the second example uses the setter method. In the first
# example, line 9 uses the getter method to return the @template instance
# variable, while the second example unnecessarily uses self to reference
# the calling object. Since you're in a Class, you already have direct access
# to the calling object and don't need to use self in this situation.

## Question 7

# class Light
#   attr_accessor :brightness, :color
#
#   def initialize(brightness, color)
#     @brightness = brightness
#     @color = color
#   end
#
#   def self.information
#     "I want to turn on the light with a brightness level of super high and a colour of green"
#   end
#
# end
#
# puts Light.information

## HARD 1

## Question 1

# class SecretFile
#   def initialize(secret_data, logger)
#     @data = secret_data
#     @logger = logger
#   end
#
#   def data
#     @logger.create_log_entry
#     @data
#   end
# end
#
# class SecurityLogger
#   def create_log_entry
#     # ... implementation omitted ...
#   end
# end

## Question 2,3,4

# module Moveable
#   attr_accessor :speed, :heading, :fuel_efficiency
#   attr_writer :fuel_capacity
#
#   def range
#     @fuel_capacity * @fuel_efficiency
#   end
# end
#
# class WheeledVehicle
#   include Moveable
#
#   def initialize(tire_array, km_traveled_per_liter, liters_of_fuel_capacity)
#     @tires = tire_array
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#   end
#
#   def tire_pressure(tire_index)
#     @tires[tire_index]
#   end
#
#   def inflate_tire(tire_index, pressure)
#     @tires[tire_index] = pressure
#   end
# end
#
# class Auto < WheeledVehicle
#   def initialize
#     # 4 tires are various tire pressures
#     super([30,30,32,32], 50, 25.0)
#   end
# end
#
# class Motorcycle < WheeledVehicle
#   def initialize
#     # 2 tires are various tire pressures
#     super([20,20], 80, 8.0)
#   end
# end
#
# class Seacraft
#   include Moveable
#
#   attr_accessor :propeller_count, :hull_count
#
#   def initialize(num_propellers, num_hulls, km_traveled_per_liter, liters_of_fuel_capacity)
#     @fuel_efficiency = km_traveled_per_liter
#     @fuel_capacity = liters_of_fuel_capacity
#     @propeller_count = num_propellers
#     @hull_count = num_hulls
#     # ... other code to track catamaran-specific data omitted ...
#   end
#
#   def range
#     super + 10
#   end
# end
#
# class Motorboat < Seacraft
#   def initialize(km_traveled_per_liter, liters_of_fuel_capacity)
#     super(1, 1, km_traveled_per_liter, liters_of_fuel_capacity)
#   end
# end
#
# class Catamaran < Seacraft
# end
#
# cat = Catamaran.new(8, 4, 25, 15)
# auto = Auto.new
# motor = Motorcycle.new
#
# p cat.fuel_efficiency
# p auto.fuel_efficiency
# p motor.fuel_efficiency
#
# p cat.range
# p auto.range
# p motor.range
