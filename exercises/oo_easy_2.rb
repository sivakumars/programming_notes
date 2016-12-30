## Exercise 1

# module Mailable
#   def print_address
#     puts "#{name}"
#     puts "#{address}"
#     puts "#{city}, #{state} #{zipcode}"
#   end
# end
#
# class Customer
#   include Mailable
#
#   attr_reader :name, :address, :city, :state, :zipcode
# end
#
# class Employee
#   include Mailable
#
#   attr_reader :name, :address, :city, :state, :zipcode
# end
#
# betty = Customer.new
# bob = Employee.new
# betty.print_address
# bob.print_address

## Exercise 2

# module Drivable
#   def drive
#   end
# end
#
# class Car
#   include Drivable
# end
#
# bobs_car = Car.new
# bobs_car.drive

## Exercise 3

# class House
#   attr_reader :price
#   include Comparable
#
#   def initialize(price)
#     @price = price
#   end
#
#   def <=>(other_house)
#     self.price <=> other_house.price
#   end
# end
#
# home1 = House.new(100_000)
# home2 = House.new(150_000)
# puts "Home 1 is cheaper" if home1 < home2
# puts "Home 2 is more expensive" if home2 > home1

## Exercise 4

# class Transform
#   def initialize(data)
#     @data = data
#   end
#
#   def uppercase
#     data.upcase
#   end
#
#   def self.lowercase(str)
#     str.downcase
#   end
#
#   private
#   attr_reader :data
# end
#
# my_data = Transform.new('abc')
# puts my_data.uppercase
# puts Transform.lowercase('XYZ')

## Exercise 5

# class Something
#   def initialize
#     @data = 'Hello'
#   end
#
#   def dupdata
#     @data + @data
#   end
#
#   def self.dupdata
#     'ByeBye'
#   end
# end
#
# thing = Something.new
# puts Something.dupdata
# puts thing.dupdata

## Exercise 6

# class Wallet
#   include Comparable
#
#   def initialize(amount)
#     @amount = amount
#   end
#
#   def <=>(other_wallet)
#     amount <=> other_wallet.amount
#   end
#
#   protected
#
#   attr_reader :amount
# end
#
# bills_wallet = Wallet.new(500)
# pennys_wallet = Wallet.new(465)
# if bills_wallet > pennys_wallet
#   puts 'Bill has more money than Penny'
# elsif bills_wallet < pennys_wallet
#   puts 'Penny has more money than Bill'
# else
#   puts 'Bill and Penny have the same amount of money.'
# end

## Exercise 7

# class Pet
#   attr_reader :animal, :name
#
#   def initialize(animal, name)
#     @animal = animal
#     @name = name
#   end
# end
#
# class Owner
#   attr_accessor :name, :pets
#
#   def initialize(name)
#     @name = name
#     @pets = []
#   end
#
#   def number_of_pets
#     pets.count
#   end
# end
#
# class Shelter
#   attr_accessor :adopters
#
#   def initialize
#     @adopters = []
#   end
#
#   def adopt(owner, pet)
#     owner.pets << pet
#     adopters << owner unless adopters.include?(owner)
#   end
#
#   def print_adoptions
#     adopters.each do |adopter|
#       puts "#{adopter.name} has adopted the following pets:"
#       adopter.pets.each do |pet|
#         puts "a #{pet.animal} named #{pet.name}"
#       end
#       puts ""
#     end
#   end
# end
#
# butterscotch = Pet.new('cat', 'Butterscotch')
# pudding      = Pet.new('cat', 'Pudding')
# darwin       = Pet.new('bearded dragon', 'Darwin')
# kennedy      = Pet.new('dog', 'Kennedy')
# sweetie      = Pet.new('parakeet', 'Sweetie Pie')
# molly        = Pet.new('dog', 'Molly')
# chester      = Pet.new('fish', 'Chester')
#
# phanson = Owner.new('P Hanson')
# bholmes = Owner.new('B Holmes')
#
# shelter = Shelter.new
# shelter.adopt(phanson, butterscotch)
# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."

## Exercise 8

# class Expander
#   def initialize(string)
#     @string = string
#   end
#
#   def to_s
#     expand(3)
#   end
#
#   private
#
#   def expand(n)
#     @string * n
#   end
#
# end
#
# expander = Expander.new('xyz')
# puts expander

## Exercise 9/10

# module Walkable
#   def walk
#     "#{name} #{gait} forward"
#   end
# end
#
# class Person
#   attr_reader :name
#   include Walkable
#
#   def initialize(name)
#     @name = name
#   end
#
#   private
#
#   def gait
#     "strolls"
#   end
# end
#
# class Cat
#   attr_reader :name
#   include Walkable
#
#   def initialize(name)
#     @name = name
#   end
#
#   private
#
#   def gait
#     "saunters"
#   end
# end
#
# class Cheetah
#   attr_reader :name
#   include Walkable
#
#   def initialize(name)
#     @name = name
#   end
#
#   private
#
#   def gait
#     "runs"
#   end
# end
#
# class Noble
#   attr_reader :last_name, :title
#   include Walkable
#
#   def initialize(last_name, title)
#     @last_name = last_name
#     @title = title
#   end
#
#   def name
#     "#{title} #{last_name}"
#   end
#
#   def gait
#     "struts"
#   end
# end
#
# mike = Person.new("Mike")
# p mike.walk
#
# kitty = Cat.new("Kitty")
# p kitty.walk
#
# flash = Cheetah.new("Flash")
# p flash.walk
#
# byron = Noble.new("Byron", "Lord")
# p byron.walk
