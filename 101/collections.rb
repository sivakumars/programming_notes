require 'pry'

# def select_fruit(produce)
#   produce_keys = produce.keys
#   counter = 0
#   selected_fruits = {}
#
#   loop do
#     break if counter == hash.size
#
#     if produce[produce_keys[counter]] == 'Fruit'
#       selected_fruits[produce_keys[counter]] = produce[produce_keys[counter]]
#     end
#
#     counter += 1
#   end
#
#   selected_fruits
# end
#
# produce = {
#   'apple' => 'Fruit',
#   'carrot' => 'Vegetable',
#   'pear' => 'Fruit',
#   'broccoli' => 'Vegetable'
# }
#
# p select_fruit(produce) # => {"apple"=>"Fruit", "pear"=>"Fruit"}

# def double_numbers(numbers)
#   doubled_numbers = []
#   counter = 0
#   while counter < numbers.size
#     counter.odd? ? doubled_numbers << numbers[counter]*2 : doubled_numbers << numbers[counter]
#     counter += 1
#   end
#   doubled_numbers
# end
#
# array = [1, 4, 3, 7, 2, 6]
# p double_numbers(array)

# def multiply(numbers, multiplier)
#   multiplied_numbers = []
#   counter = 0
#   while counter < numbers.size
#     multiplied_numbers << multiplier * numbers[counter]
#     counter += 1
#   end
#   multiplied_numbers
# end
#
# my_numbers = [1, 4, 3, 7, 2, 6]
# p multiply(my_numbers, 3)

# def select_letter(sentence, character)
#   selected_chars = ''
#   counter = 0
#
#   while counter < sentence.size
#     current_char = sentence[counter]
#     selected_chars << current_char if current_char == character
#     counter += 1
#   end
#   selected_chars
# end
#
# question = 'How many times does a particular character appear in this sentence?'
# p select_letter(question, 'a') # => "aaaaaaaa"
# p select_letter(question, 't') # => "ttttt"
# p select_letter(question, 'z') # => ""
#
# p select_letter(question, 'a').size # => 8
# p select_letter(question, 't').size # => 5
# p select_letter(question, 'z').size # => 0

# output = [1, 2, 3].each_with_object([1, 3]) do |num, array|
#   array << num if num.odd?
# end
#
# p output

# array = [5, 3, 4, 1, 2]
#
# p array.sort { |a,b| b <=> a }
#
# p array.sort_by { |num| -num }

# arr = ['10', '11', '9', '7', '8']
#
# p arr.map(&:to_i).sort.reverse.map(&:to_s)
#
# p arr.sort { |a,b| b.to_i <=> a.to_i }
#
# books = [
#   {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
#   {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
#   {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
#   {title: 'Ulysees', author: 'James Joyce', published: '1922'}
# ]
#
# sorted = books.sort_by do |hash|
#   hash[:published]
# end
#
# p sorted

## Exercise 1

# arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]
#
# p arr1[2][1][3]
#
# arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]
#
# p arr2[1][:third][0]
#
# arr3 = [['abc'], ['def'], {third: ['ghi']}]
#
# p arr3[2][:third][0][0]
#
# hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}
#
# p hsh1['b'][1]
#
# hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}
#
# p hsh2[:third].keys[0]

## Exercise 2

# arr1 = [1, [2, 3], 4]
# arr1[1][1] = 4
# p arr1
#
# arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]
# arr2[2] = 4
# p arr2
#
# hsh1 = {first: [1, 2, [3]]}
# hsh1[:first][2][0] = 4
# p hsh1
#
# hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}
# hsh2[['a']][:a][2] = 4
# p hsh2

## Exercise 3

a = 2
b = [5, 8]
arr = [a, b] # => [2, [5, 8]]

arr[0] += 2 # => [4, [5, 8]]
arr[1][0] -= a # => [4, [3, 8]]

# a = 2; b = [3, 8]

## Exercise 4

# hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}
#
# hsh.each do |_, value|
#   value.each do |string|
#     string.chars.each do |char|
#       puts char if char =~ /[aeiou]/
#     end
#   end
# end

## Exercise 5

# arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]
#
# sorted_arr = arr.map do |array|
#   array.sort do |a, b|
#     b <=> a
#   end
# end
# p sorted_arr

## Exercise 6

# array = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]
#
# incremented_array = array.map do |hash|
#    hash.each do |key, value|
#      hash[key] += 1
#    end
# end
#
# p incremented_array

## Exercise 7

# arr = [[2], [3, 5, 7], [9], [11, 13, 15]]
#
# new_arr = arr.map do |sub_arr|
#   sub_arr.select do |num|
#     num % 3 == 0
#   end
# end
#
# p new_arr

## Exercise 8

# arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
#
# new_hash = arr.each_with_object({}) do |sub_arr, hash|
#   hash[sub_arr[0]] = sub_arr[1]
# end
#
# p new_hash

## Exercise 9

# arr = [[7, 6, 7], [1, 4, 9], [5, 8, 3]]
#
# sorted_arr = arr.sort_by do |sub_arr|
#   sub_arr.select { |num| num.odd? }.reduce(:+)
# end
#
# p sorted_arr

## Exercise 10

# hsh = {
#   'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
#   'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
#   'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
#   'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
#   'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
# }
#
# array = hsh.map do |_, value|
#   if value[:type] == 'fruit'
#     value[:colors].map(&:capitalize)
#   elsif value[:type] == 'vegetable'
#     value[:size].upcase
#   end
# end
#
# p array
# # => [["Red", "Green"], "MEDIUM", ["Red", "Green"], ["Orange"], "LARGE"]

## Exercise 11
# require 'pry'
# arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]
#
# new_arr = arr.select do |hash|
#   hash.all? do |_, value|
#     value.all? {|num| num.even?}
#   end
# end
#
# p new_arr

## Exercise 12

# arr = [['stars', 'river'], 'letter', ['leaves', ['horses', 'table']]]
#
# arr.each_with_object([]) do |element1, new_arr|
#   if element1.size >= 5
#     new_arr << element1
#   else
#     element1.each do |element2|
#       if element2.size >= 5
#         new_arr << element2
#       else
#         element2.each do |element3|
#           new_arr << element3
#         end
#       end
#     end
#   end
#   p new_arr
# end

## Exercise 1

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#
# new_hash = {}
#
# flintstones.each_with_index do |element, index|
#   new_hash[element] = index
# end
#
# p new_hash

## Exercise 2

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#
# p ages.values.reduce(:+)

## Exercise 3

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# young_ages = {}
# ages.each do |key, value|
#   young_ages[key] = value if value < 100
# end
#
# p young_ages

## Exercise 4

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#
# p ages.values.min

## Exercise 5

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# answer = nil
# flintstones.each_with_index do |name, index|
#   if name[0..1] == "Be"
#     answer = index
#     break
#   end
# end
#
# p answer

## Exercise 6

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# short = flintstones.map { |name| name[0,3] }
# p short

## Exercise 7

# statement = "The Flintstones Rock"
#
# new_hash = statement.chars.each_with_object({}) do |char, hash|
#   hash[char] = statement.count(char) unless char == " "
# end
#
# p new_hash.sort.to_h

## Exercise 8

# 1 3
# 1 2

## Exercise 9

# def titleize(string)
#   string.split.map(&:capitalize).join(" ")
# end
#
# p titleize("the flintstones rock")

## Exercise 10

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# munsters.each do |_, details|
#   details["age_group"] = case details["age"]
#                          when 0..18
#                            "kid"
#                          when 18..65
#                            "adult"
#                          else
#                            "senior"
#                          end
# end
#
# p munsters

## Exercise 11

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" }
# }
#
# total_male_sage = 0
# munsters.each do |name, details|
#   total_male_age += details["age"] if details["gender"] == "male"
# end
#
# p total_age

## Exercise 12

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# munsters.each do |name, details|
#   puts "#{name} is a #{details["age"]} year old #{details["gender"]}."
# end

## Exercise 13

# sections = [8, 4, 4, 4, 12]
# chars = ('a'..'z').to_a + (1..9).map(&:to_s).to_a
#
# uuid = ""
# sections.each do |num|
#   1.upto(num) { uuid << chars.sample }
#   uuid << "-"
# end
#
# puts uuid.chop
