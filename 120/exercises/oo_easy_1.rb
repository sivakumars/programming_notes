## Exercise 1

# class Banner
#   def initialize(message)
#     @message = message
#   end
#
#   def to_s
#     [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
#   end
#
#   private
#
#   def horizontal_rule
#     '+' + '-' * (@message.length + 2) + '+'
#   end
#
#   def empty_line
#     '|' + ' ' * (@message.length + 2) + '|'
#   end
#
#   def message_line
#     "| #{@message} |"
#   end
# end
#
#
# banner = Banner.new('To boldly go where no one has gone before.')
# puts banner
#
# banner = Banner.new('')
# puts banner

## Exercise 2

# class Pet
#   attr_reader :name
#
#   def initialize(name)
#     @name = name.to_s
#   end
#
#   def to_s
#     "My name is #{@name.upcase}."
#   end
# end
#
# name = 'Fluffy'
# fluffy = Pet.new(name)
# puts fluffy.name
# puts fluffy
# puts fluffy.name
# puts name

## Exercise 3

# class Book
#   attr_reader :author, :title
#
#   def initialize(author, title)
#    @author = author
#     @title = title
#   end
#
#   def to_s
#     %("#{title}", by #{author})
#   end
# end
#
# book = Book.new("Neil Stephenson", "Snow Crash")
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

## Exercise 4

# class Book
#   attr_accessor :author, :title
#
#   def to_s
#     %("#{title}", by #{author})
#   end
# end
#
# book = Book.new
# book.author = "Neil Stephenson"
# book.title = "Snow Crash"
# puts %(The author of "#{book.title}" is #{book.author}.)
# puts %(book = #{book}.)

## Exercise 5

# class Person
#   attr_writer :first_name, :last_name
#
#   def initialize(first_name, last_name)
#     @first_name = first_name.capitalize
#     @last_name = last_name.capitalize
#   end
#
#   def to_s
#     "#{@first_name.capitalize} #{@last_name.capitalize}"
#   end
# end
#
# person = Person.new('john', 'doe')
# puts person
#
# person.first_name = 'jane'
# person.last_name = 'smith'
# puts person

## Exercise 6

# class Flight
#   def initialize(flight_number)
#     @database_handle = Database.init
#     @flight_number = flight_number
#   end
# end

## Exercise 7

# class Car
#   attr_accessor :mileage
#
#   def initialize
#     @mileage = 0
#   end
#
#   def increment_mileage(miles)
#     total = mileage + miles
#     self.mileage = total
#   end
#
#   def print_mileage
#     puts mileage
#   end
# end
#
# car = Car.new
# car.mileage = 5000
# car.increment_mileage(678)
# car.print_mileage  # should print 5678

## Exercise 8

# class Rectangle
#   def initialize(height, width)
#     @height = height
#     @width = width
#   end
#
#   def area
#     @height * @width
#   end
# end
#
# class Square < Rectangle
#   def initialize(side_length)
#     super(side_length, side_length)
#   end
# end
#
# square = Square.new(5)
# puts "area of square = #{square.area}"

## Exercise 9

# class Pet
#
#   def initialize(name, age)
#     @name = name
#     @age = age
#   end
# end
#
# class Cat < Pet
#   attr_reader :name, :age, :fur_color
#
#   def initialize(name, age, fur_color)
#     super(name, age)
#     @fur_color = fur_color
#   end
#
#   def to_s
#     "My cat #{name} is #{age} years old and has #{fur_color} fur."
#   end
# end
#
# pudding = Cat.new('Pudding', 7, 'black and white')
# butterscotch = Cat.new('Butterscotch', 10, 'tan and white')
# puts pudding, butterscotch

## Exercise 10

# class Vehicle
#   attr_reader :make, :model
#
#   def initialize(make, model)
#     @make = make
#     @model = model
#   end
#
#   def to_s
#     "#{make} #{model}"
#   end
# end
#
#
# class Car < Vehicle
#   def wheels
#     4
#   end
# end
#
# class Motorcycle < Vehicle
#   def wheels
#     2
#   end
# end
#
# class Truck < Vehicle
#   attr_reader :payload
#
#   def initialize(make, model, payload)
#     super(make, model)
#     @payload = payload
#   end
#
#   def wheels
#     6
#   end
# end
