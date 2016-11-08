## Question 1
#
# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# p ages.has_key?("Spot")
# p ages.key?("Spot")
# p ages.include?("Spot")
#
## Question 2

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#
# array_ages = ages.values
#
# sum = 0
# array_ages.each do |value|
#   sum += value
# end
#
# p sum
#
# p ages.values.reduce(:+)

## Question 3

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }
#
# p ages.delete_if { |_, value| value >= 100}

## Question 4

# munsters_description = "The Munsters are creepy in a good way."
#
# p one = munsters_description.gsub("Munsters", "munsters")
# p two = munsters_description
# p three = munsters_description.downcase
# p four = munsters_description.upcase

## Question 5

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10 }
#
# additional_ages = { "Marilyn" => 22, "Spot" => 237 }
#
# ages.merge!(additional_ages)

## Question 6

# ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }
#
# ages.values.min

## Question 7

# advice = "Few things in life are as important as house training your pet dinosaur."
#
# advice.include?("Dino")
# advice.match("Dino")

## Question 8

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# flintstones.each_with_index { |value, index| p index if value.start_with?("Be")}
# flintstones.index { |name| name[0, 2] == "Be" }

## Question 9

# flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)
#
# flintstones.map! { |name| name = name[0,3] }

## Question 10

# same as above
