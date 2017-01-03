# CLASSES & OBJECTS

## Exercise 1

# class Person
#   attr_accessor :name
#
#   def initialize(name)
#     @name = name
#   end
#
# end
#
# bob = Person.new('bob')
# puts bob.name                  # => 'bob'
# bob.name = 'Robert'
# puts bob.name                  # => 'Robert'

## Exercise 2

# class Person
#   attr_accessor :last_name, :first_name
#
#   def initialize(name)
#     @first_name = name.split.first
#     @last_name = name.split.size > 1 ? name.split.last : ''
#   end
#
#   def name
#     "#{self.first_name} #{self.last_name}".strip
#   end
#
# end
#
# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'

## Exercise 3

# class Person
#   attr_accessor :last_name, :first_name
#
#   def initialize(name)
#     parse_full_name(name)
#   end
#
#   def name=(name)
#     parse_full_name(name)
#   end
#
#   def name
#     "#{self.first_name} #{self.last_name}".strip
#   end
#
#   private
#
#   def parse_full_name(name)
#     @first_name = name.split.first
#     @last_name = name.split.size > 1 ? name.split.last : ''
#   end
#
# end
#
# bob = Person.new('Robert')
# p bob.name                  # => 'Robert'
# p bob.first_name            # => 'Robert'
# p bob.last_name             # => ''
# bob.last_name = 'Smith'
# p bob.name                  # => 'Robert Smith'
#
# bob.name = "John Adams"
# p bob.first_name            # => 'John'
# p bob.last_name             # => 'Adams'

## Exercise 4

# class Person
#   attr_accessor :first_name, :last_name
#
#   def initialize(full_name)
#     parse_full_name(full_name)
#   end
#
#   def name
#     "#{first_name} #{last_name}".strip
#   end
#
#   def name=(full_name)
#     parse_full_name(full_name)
#   end
#
#   def same_name?(other_person)
#     name == other_person.name
#   end
#
#   private
#
#   def parse_full_name(full_name)
#     parts = full_name.split
#     self.first_name = parts.first
#     self.last_name = parts.size > 1 ? parts.last : ''
#   end
# end
#
# bob = Person.new('Robert Smith')
# rob = Person.new('Robert Smith')
# p bob.same_name?(rob)

## INHERITANCE

## Exercise 1

# class Dog
#   def speak
#     'bark!'
#   end
#
#   def swim
#     'swimming!'
#   end
# end
#
# class Bulldog < Dog
#   def swim
#     "can't swim!"
#   end
# end
#
# teddy = Dog.new
# puts teddy.speak
# puts teddy.swim
# bully = Bulldog.new
# puts bully.speak
# puts bully.swim

## Exercise 2

# class Dog
#   def speak
#     'bark!'
#   end
#
#   def swim
#     'swimming!'
#   end
#
#   def run
#     'running!'
#   end
#
#   def jump
#     'jumping!'
#   end
#
#   def fetch
#     'fetching!'
#   end
# end
#
# class Cat < Dog
#   def swim
#     "can't swim!"
#   end
#
#   def fetch
#     "can't fetch!"
#   end
# end
