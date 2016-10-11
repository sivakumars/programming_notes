def factorial(number)
    result = number
  while number > 1
    result = result * (number - 1)
    number = number - 1
  end
  return result

end

puts factorial(5)
puts factorial(6)
puts factorial(7)
puts factorial(8)
