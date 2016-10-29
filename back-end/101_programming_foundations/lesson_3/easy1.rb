## Question 1

# 1
# 2
# 2
# 3

## Question 2

# In one scenario, both can be found as the last character in a method name
# ! indicates the method "mutates the caller" — it permanently changes the input.
# ? indicates that the method is a boolean method and will return true or false.
# ! can also mean "not" if used in equality comparisons.
#
# 1. != means "not equal to" and is used if you want to return true when two
#   variables are not equal to each other
# 2. This is a "not". If user_name exists, this returns false. If user_name
#   does not exist, this returns true.
# 3. The ! will mutate the caller when returning an array in the "uniq" method.
#   However, the ! is only available for select methods.
# 4. Nothing would happen.
# 5. Nothing would happen but it could indicate that your method is a boolean
#   method. It helps a future reader of your code.
# 6. This would be a "not not", or double "not". If user_name exists, this would
#   return true. If it doesn't exist, it'll return false.

## Question 3

# advice = "Few things in life are as important as house training your pet dinosaur"
#
# sentence_array = advice.split(' ')
#
# new_array = []
# sentence_array.each do |word|
#   if word == 'important'
#     new_array.push('urgent')
#   else
#     new_array.push(word)
#   end
# end
#
# puts new_array.join(' ')

## Question 4

# 1. Deletes "2" because it's at index = 1.
# 2. Deletes "1" because it's value = 1.

## Question 5

# def between_10_100?(number)
#   (10..100).include?(number)
# end
#
# puts between_10_100?(42)

## Question 6

# famous_words = "seven years ago..."
# puts first_way = famous_words.prepend("Four score and ")
#
# famous_words = "seven years ago..."
# puts second_way = famous_words.insert(0, "Four score and ")

## Question 7

# 2 + 8 + 8 + 8 + 8 + 8 = 42

## Question 8

# flintstones = ["Fred" , "Wilma"]
# flintstones << ["Barney", "Betty"]
# flintstones << ["BamBam", "Pebbles"]
#
# flintstones.flatten!

## Question 9

# flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }
#
# barney_array = []
# p barney_array.push(flintstones.key(2)).push(flintstones["Barney"])
#
# flintstones.assoc("Barney")

## Question 10

# flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]
#
# flint_hash = {}
#
# flintstones.each_with_index { |name, index| flint_hash[name] = index }
#
# p flint_hash
