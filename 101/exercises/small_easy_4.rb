# Question 1

def short_long_short(str1, str2)
  sorted_strings = [str1, str2].sort_by { |str| str.length }
  sorted_strings[0] + sorted_strings[1] + sorted_strings[0]
end

puts short_long_short('abc', 'defgh') == "abcdefghabc"
puts short_long_short('abcde', 'fgh') == "fghabcdefgh"
puts short_long_short('', 'xyz') == "xyz"

# Question 2

def century(year)
  century = year / 100
  century += 1 unless year.to_s[-1] == '0'
  century = century.to_s

  suffix =
    if century[-2..-1] == '11' || century[-2..-1] == '12' || century[-2..-1] == '13'
      'th'
    elsif century[-1] == '1'
      'st'
    elsif century[-1] == '2'
      'nd'
    elsif century[-1] == '3'
      'rd'
    else
      'th'
    end

  century + suffix
end

puts century(2000)
puts century(2001)
puts century(1965)
puts century(256)
puts century(5)
puts century(10103)
puts century(1052)
puts century(1127)
puts century(11201)

# Question 3

def leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

def leap_year?(year)
  first_test = year % 100 != 0 if year % 4 == 0
  second_test =
    if year % 100 == 0 && !first_test
      year % 400 == 0
    else
      !!first_test
    end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == false
puts leap_year?(1) == false
puts leap_year?(100) == false
puts leap_year?(400) == true

# Question 4

def gregorian_leap_year?(year)
  if year % 400 == 0
    true
  elsif year % 100 == 0
    false
  else
    year % 4 == 0
  end
end

def leap_year?(year)
  if year >= 1752
    gregorian_leap_year?(year)
  else
    year % 4 == 0
  end
end

puts leap_year?(2016) == true
puts leap_year?(2015) == false
puts leap_year?(2100) == false
puts leap_year?(2400) == true
puts leap_year?(240000) == true
puts leap_year?(240001) == false
puts leap_year?(2000) == true
puts leap_year?(1900) == false
puts leap_year?(1752) == true
puts leap_year?(1700) == true
puts leap_year?(1) == false
puts leap_year?(100) == true
puts leap_year?(400) == true

# Question 5

def multisum(max_value)
  multiples = []
  (1..max_value).each_entry do |number|
    multiples << number if (number % 3 == 0 || number % 5 == 0)
  end
  multiples.reduce(:+)
end

puts multisum(3)
puts multisum(5)
puts multisum(10)
puts multisum(1000)

# Question 6

def running_total(numbers)
  total = 0
  sums = []
  numbers.each do |number|
    total = total + number
    sums << total
  end
  sums
end

def running_total(numbers)
  sum = 0
  numbers.map do |number|
    sum += number
  end
end

puts running_total([2, 5, 13]) == [2, 7, 20]
puts running_total([14, 11, 7, 15, 20]) == [14, 25, 32, 47, 67]
puts running_total([3]) == [3]
puts running_total([]) == []

# Question 7

DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def string_to_integer(string)
  digits = string.chars.map { |char| DIGITS[char] }
  value = 0
  multiplier = 1
  digits.reverse.each do |digit|
    value += multiplier * digit
    multiplier *= 10
  end
  value
end

puts string_to_integer('4321')
puts string_to_integer('570')

# Question 8

SIGNS = { '+' => 1, '-' => -1 }

def string_to_signed_integer(string)
  if string.start_with?('+', '-')
    multiplier = SIGNS[string[0]]
    string[0] = ''
  else
    multiplier = 1
  end

  string_to_integer(string) * multiplier
end

puts string_to_signed_integer('4321')
puts string_to_signed_integer('-570')
puts string_to_signed_integer('+100')

# Question 9

DIGITS = { '0' => 0, '1' => 1, '2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9 }

def integer_to_string(integer)
  return '0' if integer == 0

  digits = []
  while integer > 0
    digits << integer % 10
    integer /= 10
  end

  digits.map { |digit| DIGITS.key(digit) }
  digits.reverse.join
end

# puts integer_to_string(4321) == '4321'
# puts integer_to_string(0) == '0'
# puts integer_to_string(5000) == '5000'

## Question 10

def signed_integer_to_string(integer)
  if integer > 0
    '+' + integer_to_string(integer)
  elsif integer < 0
    '-' + integer_to_string(-integer)
  else
    '0'
  end
end

puts signed_integer_to_string(4321) == '+4321'
puts signed_integer_to_string(-123) == '-123'
puts signed_integer_to_string(0) == '0'
