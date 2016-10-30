## Question 1

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" }
# }
#
# total_male_age = 0
#
# munsters.each do |person, details|
#   p total_age += details["age"] if details["gender"] == "male"
# end

## Question 2

# munsters = {
#   "Herman" => { "age" => 32, "gender" => "male" },
#   "Lily" => { "age" => 30, "gender" => "female" },
#   "Grandpa" => { "age" => 402, "gender" => "male" },
#   "Eddie" => { "age" => 10, "gender" => "male" },
#   "Marilyn" => { "age" => 23, "gender" => "female"}
# }
#
# munsters.each do |person, details|
#   puts "#{person} is a #{details["age"]} year old #{details["gender"]}."
# end

## Question 3

# def tricky_method(a_string_param, an_array_param)
#   a_string_param += "rutabaga"
#   an_array_param += ["rutabaga"]
#   return a_string_param, an_array_param
# end
#
# my_string = "pumpkins"
# my_array = ["pumpkins"]
# my_string, my_array = tricky_method(my_string, my_array)
#
# puts "My string looks like this now: #{my_string}"
# puts "My array looks like this now: #{my_array}"

## Question 4

# sentence = "Humpty Dumpty sat on a wall."
#
# p sentence.split(/\W/).reverse.join(" ") + ''

## Question 5

# 34

## Question 6

# The munsters hash is untouched. The method returns a new hash with the
# ransacked data.
#
# WRONG. Ruby passes the actual object id to the method (not just its value).
# Therefore, the method can modify the input variables permanently unless
# they are assigned to new variables within the method first.

## Question 7

# rps(rps(rps("rock", "paper"), rps("rock", "scissors")), "rock")
# rps(rps(rps("rock", "paper"), "rock"), "rock")
# rps(rps("paper", "rock"), "rock")
# rps("paper", "rock")
# "paper"

## Question 8

bar(foo)
bar("yes")
"no"
