## Exercise 1

# class Person
#   def name
#     @name
#   end
#
#   def name=(name)
#     @name = name
#   end
# end
#
# person1 = Person.new
# person1.name = 'Jessica'
# puts person1.name

## Exercise 2

# class Person
#   attr_accessor :name
#   attr_writer :phone_number
# end
#
# person1 = Person.new
# person1.name = 'Jessica'
# person1.phone_number = '0123456789'
# puts person1.name

## Exercise 3

# class Person
#   attr_reader :phone_number
#
#   def initialize(number)
#     @phone_number = number
#   end
#
# end
#
# person1 = Person.new(1234567899)
# puts person1.phone_number
#
# person1.phone_number = 9987654321
# puts person1.phone_number

## Exercise 4

# class Person
#   attr_accessor :first_name
#   attr_writer :last_name
#
#   def first_equals_last?
#     first_name == last_name
#   end
#
#   private
#
#   attr_reader :last_name
# end
#
# person1 = Person.new
# person1.first_name = 'Dave'
# person1.last_name = 'Smith'
# puts person1.first_equals_last?

## Exercise 5

# class Person
#   attr_writer :age
#
#   def older_than?(other)
#     age > other.age
#   end
#
#   private
#
#   attr_reader :age
#
# end
#
# person1 = Person.new
# person1.age = 17
#
# person2 = Person.new
# person2.age = 26
#
# puts person1.older_than?(person2)

## Exercise 6

# class Person
#   attr_reader :name
#
#   def name=(value)
#     @name = value.capitalize
#   end
# end
#
# person1 = Person.new
# person1.name = 'eLiZaBeTh'
# puts person1.name

## Exercise 7

# class Person
#   attr_writer :name
#
#   def name
#     "Mr. " + @name
#   end
# end
#
# person1 = Person.new
# person1.name = 'James'
# puts person1.name

## Exercise 8
#
# class Person
#
#   def initialize(name)
#     @name = name
#   end
#
#   def name
#     @name.clone
#   end
# end
#
# person1 = Person.new('James')
# person1.name.reverse!
# puts person1.name

## Exercise 9

# class Person
#   def age
#     @age * 2
#   end
#
#   def age=(value)
#     @age = value * 2
#   end
# end
#
# person1 = Person.new
# person1.age = 20
# puts person1.age

## Exercise 10

# class Person
#
#   def name
#     "#{@first_name} #{@last_name}"
#   end
#
#   def name=(string)
#     @first_name = string.split.first
#     @last_name = string.split.last
#   end
# end
#
# person1 = Person.new
# person1.name = 'John Doe'
# puts person1.name
