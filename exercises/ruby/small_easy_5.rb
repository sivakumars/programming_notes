## Question 1

# def ascii_value(string)
#   ascii_sum = 0
#   string.each_char do |char|
#     ascii_sum += char.ord
#   end
#   ascii_sum
# end
#
# puts ascii_value('Four score')
# puts ascii_value('Launch School')
# puts ascii_value('a')
# puts ascii_value('')

## Question 2

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
#
# def time_of_day(number)
#   hours, minutes = number.divmod(MINUTES_PER_HOUR)
#   if number > 0
#     hours = hours % HOURS_PER_DAY
#   elsif number < 0
#     hours = -hours % HOURS_PER_DAY
#     hours = (0..23).to_a[-hours]
#   end
#   "#{format("%02d", hours)}:#{format("%02d", minutes)}"
# end
#
# puts time_of_day(0)
# puts time_of_day(-3)
# puts time_of_day(35)
# puts time_of_day(-1437)
# puts time_of_day(3000)
# puts time_of_day(800)
# puts time_of_day(-4231)

## Question 3

# MINUTES_PER_HOUR = 60
# HOURS_PER_DAY = 24
# MINUTES_PER_DAY = MINUTES_PER_HOUR * HOURS_PER_DAY
#
# def after_midnight(time)
#   hours, minutes = time.split(':').map(&:to_i)
#   (hours * MINUTES_PER_HOUR + minutes) % MINUTES_PER_DAY
# end
#
# def before_midnight(time)
#   (MINUTES_PER_DAY - after_midnight(time)) % MINUTES_PER_DAY
# end
#
# puts after_midnight('00:00')
# puts before_midnight('00:00')
# puts after_midnight('12:34')
# puts before_midnight('12:34')
# puts after_midnight('24:00')
# puts before_midnight('24:00')

## Question 4

# def swap(words)
#   result = words.split.each do |word|
#     swaps = [word[0], word[-1]]
#     word[0] = swaps[1]
#     word[-1] = swaps[0]
#   end
#   result.join(' ')
# end
#
# puts swap('Oh what a wonderful day it is')
# puts swap('Abcde')
# puts swap('a')

## Question 5

# def cleanup(text)
#   text.gsub(/[^a-z]/i, ' ').squeeze(' ')
# end
#
# puts cleanup("---what's my +*& line?")

## Question 6

# def word_sizes(words)
#   counts = Hash.new(0)
#   words.split.each do |word|
#     counts[word.length] += 1
#   end
#   counts
# end
#
# puts word_sizes('Four score and seven.')
# puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
# puts word_sizes("What's up doc?")
# puts word_sizes('')

## Question 7

# def word_sizes(words)
#   counts = Hash.new(0)
#   words.split.each do |word|
#     word.gsub!(/[^a-z]/i, '')
#     counts[word.length] += 1
#   end
#   counts
# end
#
# puts word_sizes('Four score and seven.')
# puts word_sizes('Hey diddle diddle, the cat and the fiddle!')
# puts word_sizes("What's up doc?")
# puts word_sizes('')

## Question 8

# WORDS_HASH = {0=>"zero",1=>"one",2=>"two",3=>"three",4=>"four",5=>"five",6=>"six",7=>"seven",8=>"eight",9=>"nine",
#                   10=>"ten",11=>"eleven",12=>"twelve",13=>"thirteen",14=>"fourteen",15=>"fifteen",16=>"sixteen",
#                    17=>"seventeen", 18=>"eighteen",19=>"nineteen"}
#
# def alphabetic_number_sort(numbers)
#   numbers_in_english = numbers.map { |number| WORDS_HASH[number] }
#   numbers_in_english.sort.map { |number| WORDS_HASH.key(number) }
# end
#
# p alphabetic_number_sort((0..19).to_a)

## Question 9

# def crunch(string)
#   string.squeeze
# end

# def crunch(text)
#   index = 0
#   crunch_text = ''
#   while index <= text.length - 1
#     crunch_text << text[index] unless text[index] == text [index + 1]
#     index += 1
#   end
#   crunch_text
# end
#
# puts crunch('ddaaiillyy ddoouubbllee')
# puts crunch('4444abcabccba')
# puts crunch('ggggggggggggggg')
# puts crunch('a')
# puts crunch('')

## Question 10

# def print_in_box(message)
#
#   dashes = '-' * message.length
#   spaces = ' ' * message.length
#
#   puts "+-#{dashes}-+"
#   puts "| #{spaces} |"
#   puts "| #{messages} |"
#   puts "| #{spaces} |"
#   puts "+-#{dashes}-+"
# end
#
# print_in_box('To boldly go where no one has gone before.')
# print_in_box('')
