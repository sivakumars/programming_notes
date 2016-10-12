def what_number(number)
  number = case
  when number < 0
    puts "did you follow directions"
  when (number >= 0) && (number <= 50)
    puts "It's between 0 and 50"
  when (number >= 51) && (number <= 100)
    puts "it's between 51 and 100"
  when number > 100
    puts "it's greater than 100"
  end
end

puts "Pick a number between 0 and 100"
number = gets.chomp.to_i
what_number(number)
