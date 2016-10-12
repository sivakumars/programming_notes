a = [1, 2, 4, 9]

def printer(array)
  array.each_with_index do |value, index|
    puts "#{index} => #{value}"
  end
end

printer(a)
