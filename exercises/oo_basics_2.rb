## Exercise 1

# class Cat
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
# end
#
# cat = Cat.generic_greeting

## Exercise 2

# class Cat
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def rename(new_name)
#     self.name = new_name
#   end
# end
#
# kitty = Cat.new('Sophie')
# puts kitty.name
# kitty.rename('Chloe')
# puts kitty.name

## Exercise 3

# class Cat
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def identify
#     self
#   end
# end
#
# kitty = Cat.new('Sophie')
# p kitty.identify

## Exercise 4

# class Cat
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def self.generic_greeting
#     puts "Hello! I'm a cat!"
#   end
#
#   def personal_greeting
#     puts "Hello! My name is #{name}"
#   end
# end
#
# kitty = Cat.new('Sophie')
#
# Cat.generic_greeting
# kitty.personal_greeting

## Exercise 5

# class Cat
#   @@number_of_cats = 0
#
#   def initialize
#     @@number_of_cats += 1
#   end
#
#   def self.total
#     puts @@number_of_cats
#   end
#
# end
#
# kitty1 = Cat.new
# kitty2 = Cat.new
#
# Cat.total

## Exercise 6

# class Cat
#   attr_reader :name
#   COLOR = "blue"
#
#   def initialize(name)
#     @name = name
#   end
#
#   def greet
#     puts "Hello! My name is #{name} and I'm a #{COLOR} cat!"
#   end
#
# end
#
# kitty = Cat.new('Sophie')
# kitty.greet

## Exercise 7

# class Cat
#   attr_reader :name
#
#   def initialize(name)
#     @name = name
#   end
#
#   def to_s
#     "I'm #{name}!"
#   end
# end
#
# kitty = Cat.new('Sophie')
# puts kitty

## Exercise 8

# class Person
#   attr_accessor :secret
# end
#
# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# puts person1.secret

## Exercise 9

# class Person
#   attr_writer :secret
#
#   def share_secret
#     puts secret
#   end
#
#   private
#
#   attr_reader :secret
# end
#
# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
# person1.share_secret

## Exercise 10

# class Person
#   attr_writer :secret
#
#   def compare_secret(other_person)
#     p secret == other_person.secret
#   end
#
#   protected
#
#   attr_reader :secret
# end
#
# person1 = Person.new
# person1.secret = 'Shh.. this is a secret!'
#
# person2 = Person.new
# person2.secret = 'Shh.. this is a different secret!'
#
# person1.compare_secret(person2)
