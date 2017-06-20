## Question 1

# car = { type: "sedan", color: "blue", mileage: 80_000 }

## Question 2

# car = { type: "sedan", color: "blue", mileage: 80_000 }
# car[:year] = 2003
# puts car

## Question 3

# car = { type: "sedan", color: "blue", mileage: 80_000 }
# car.delete(:mileage)
# puts car

## Question 4

# car = { type: "sedan", color: "blue", mileage: 80_000 }
#
# puts car[:color]

## Question 5

# numbers = { high: 100, medium: 50, low: 10 }
#
# numbers.each { |key, value| puts "A #{key} number is #{value}."}

## Question 6

# numbers = { high: 100, medium: 50, low: 10 }
#
# half_numbers = numbers.map { |_,value| value / 2}
# p half_numbers

## Question 7

# numbers = { high: 100, medium: 50, low: 10 }
#
# low_numbers = numbers.select { |_,value| value < 25 }
#
# p low_numbers

## Question 8

# numbers = { high: 100, medium: 50, low: 10 }
#
# numbers.select! do |key, value|
#                  value < 25
#                end
#
# p numbers

## Question 9

# nested_hash =
#   {
#     car:   { type: "sedan", color: "blue", year: 2003 },
#     truck: { type: "pickup", color: "red", year: 1998 }
#   }
#
# puts nested_hash
# puts nested_hash[:truck]

## Question 10

car = { type: "sedan", color: "blue", year: 2003 }

puts car

car = [[:type, 'sedan'], [:color, 'blue'], [:year, 2003]]

p car
