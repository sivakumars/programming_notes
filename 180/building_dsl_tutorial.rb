# require 'rubygems'
# require 'sinatra'
#
# get '/hello' do
#   "Hello world."
# end

# class Array
#   def my_map
#     result = []
#     self.each do |item|
#       result << yield(item)
#     end
#     result
#   end
# end
#
# array = [1, 2, 3]
# p array.map { |item| item + 1 }
# p array.my_map { |item| item + 1 }

# def parrot(phrase)
#   yield(phrase)
# end
#
# parrot("Polly want a cracker.") do |phrase|
#   puts phrase
# end

# class Recipe
#   attr_accessor :name, :ingredients, :instructions
#
#   def initialize(name, &block)
#     self.name = name
#     self.ingredients = []
#     self.instructions = []
#
#     instance_eval(&block)
#   end
#
#   def ingredient(name, options = {})
#     ingredient = name
#     ingredient << " (#{options[:amount]})" if options[:amount]
#
#     ingredients << ingredient
#   end
#
#   def step(text, options = {})
#     instruction = text
#     instruction << " (#{options[:for]})" if options[:for]
#
#     instructions << instruction
#   end
#
#   def to_s
#     output = name
#     output << "\n#{'=' * name.size}\n\n"
#     output << "Ingredients: #{ingredients.join(', ')}\n\n"
#
#     instructions.each_with_index do |instruction, index|
#       output << "#{index + 1}) #{instruction}\n"
#     end
#
#     output
#   end
# end
#
# mac_and_cheese = Recipe.new("Mac and Cheese") do |r|
#   r.ingredient "Water", :amount => "2 cups"
#   r.ingredient "Noodles", :amount => "1 cup"
#   r.ingredient "Cheese", :amount => "1/2 cup"
#
#   r.step "Heat water to boiling.", :for => "5 minutes"
#   r.step "Add noodles to boiling water.", :for => "6 minutes"
#   r.step "Drain water."
#   r.step "Mix cheese in with noodles."
# end
#
# mac_and_cheese = Recipe.new("Mac and Cheese") do
#   ingredient "Water", :amount => "2 cups"
#   ingredient "Noodles", :amount => "1 cup"
#   ingredient "Cheese", :amount => "1/2 cup"
#
#   step "Heat water to boiling.", :for => "5 minutes"
#   step "Add noodles to boiling water.", :for => "6 minutes"
#   step "Drain water."
#   step "Mix cheese in with noodles."
# end
#
# puts mac_and_cheese

# class YieldDSL
#   attr_accessor :name
#   def initialize
#     yield(self)
#   end
# end
#
# class EvalDSL
#   attr_accessor :name
#   def initialize(&block)
#     instance_eval &block
#   end
# end
#
# yield_block = YieldDSL.new do |d|
#   d.name = "Nitin"
# end
#
# p yield_block
#
# eval_block = EvalDSL.new do
#   self.name = "Nitin"
# end
#
# p eval_block
