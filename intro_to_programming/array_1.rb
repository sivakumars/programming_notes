arr = [1, 3, 5, 7, 9, 11]
number = 3

arr.each do |num|
  if num == number then puts "Yes, the array includes at least one #{number}" end
end

if arr.include?(number)
  puts "Yes, the array has at least one #{number}"
end
