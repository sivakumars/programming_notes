names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan']

names.each { |name| puts name }

x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end
