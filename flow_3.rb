def what_number(number)
  if (number >= 0) && (number <= 50)
    puts "It's between 0 and 50"
  elsif (number >= 51) && (number <= 100)
    puts "it's between 51 and 100"
  elsif number > 100
    puts "it's greater than 100"
  else
    puts "did you follow directions?"
  end
end

puts "Pick a number between 0 and 100"
number = gets.chomp.to_i
what_number(number)
