# puts "Pick a number."
# number_one = gets.chomp.to_i
# puts "Pick another number."
# number_two = gets.chomp.to_i
# puts "What do you want to do with these numbers? You can choose among these
# options: add, subtract, multiply, or divide."
# operation = gets.chomp
#
# case operation
# when "add"
#   puts number_one + number_two
# when "subtract"
#   puts number_one - number_two
# when "multiply"
#   puts number_one * number_two
# when divide
#   puts number_one / number_two
# else
#   puts "Something went wrong."
# end

# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

Kernel.puts("Welcome to Calculator!")

Kernel.puts("Pick a number.")
number1 = Kernel.gets().chomp()

Kernel.puts("Pick a number.")
number2 = Kernel.gets().chomp()

Kernel.puts("What operation would you like for perform? 1) add 2) subtract 3) multiply 4) divide")
operator = kernel.gets().chomp()

if operator == '1'
  result = number1.to_i() + number2.to_i()
elsif operator == '2'
  result = number1.to_i() - number2.to_i()
elsif operator == '3'
  result = number1.to_i() * number2.to_i()
else operator == '4'
  result = number1.to_f() / number2.to_f()
end

Kernel.puts("The result is: #{result}")
