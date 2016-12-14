## Question 1

# if false
#   greeting = “hello world”
# end
#
# greeting
#
# I expect "nil" because false is equal to false, and therefore the boolean will
# evaluate to false and "greeting" will not get set to any value.

## Question 2

# greetings = { a: 'hi' }
# informal_greeting = greetings[:a]
# informal_greeting << ' there'
#
# puts informal_greeting  #  => "hi there"
# puts greetings
#
# { a: 'hi'}

# WRONG. The output is { a: 'hi there'}. informal_greeting isn't a new object
# so when the << operator mutates the caller, it changes the original greetings
# object/variable.

## Question 3

# A) "one", "two", "three"
# B) "one", "two", "three"
# C) "two", "three", "one"

## Question 4

# generate UUID
# - create new empty number
# - generate a random number between 0 and 3.4 * 10^38
# - convert number to hexadecimal
# - split string into uuid format

# def generate_UUID
#   uuid = rand(3.4*10**38).to_s(16)
#   uuid.insert(8,'-').insert(13,'-').insert(18,'-').insert(23,'-')
# end

# def generate_UUID
#   sections = [8, 4, 4, 4, 12]
#   characters = []
#   (0..9).each { |digit| characters << digit.to_s }
#   ('a'..'f').each { |letter| characters << letter }
#   uuid = ""
#   sections.each_with_index do |section, index|
#     section.times { uuid += characters.sample }
#     uuid += '-' unless index >= sections.length - 1
#   end
#   uuid
# end
#
# p generate_UUID

## Question 5

def dot_separated_ip_address?(input_string)
  dot_separated_words = input_string.split(".")
  return false unless dot_separated_words.size == 4
  while dot_separated_words.size > 0 do
    word = dot_separated_words.pop
    return false unless is_an_ip_number?(word)
  end
  true
end
