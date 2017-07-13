#  Exercise 1

# def url?(string)
#   !!(string =~ /\Ahttps?:\/\/\S+\z/)
#
# end
#
# p url?('http://launchschool.com')   # -> true
# p url?('https://example.com')       # -> true
# p url?('https://example.com hello') # -> false
# p url?('   https://example.com')    # -> false

# Exercise 2

# def fields(string)
#   string.split(/[,\t ]+/)
# end
#
# p fields("Pete,201,Student")
# # -> ['Pete', '201', 'Student']
#
# p fields("Pete \t 201    ,  TA")
# # -> ['Pete', '201', 'TA']
#
# p fields("Pete \t 201")
# # -> ['Pete', '201']

# Exercise 3

# def mystery_math(str)
#   str.sub(/[\+\-\*\/]/, '?')
# end
#
# p mystery_math('4 + 3 - 5 = 2')
# # -> '4 ? 3 - 5 = 2'
#
# p mystery_math('(4 * 3 + 2) / 7 - 1 = 1')
# # -> '(4 ? 3 + 2) / 7 - 1 = 1'

# Exercise 4

# def mysterious_math(str)
#   str.gsub(/[\+\-\*\/]/, '?')
# end
#
# p mysterious_math('4 + 3 - 5 = 2')           # -> '4 ? 3 ? 5 = 2'
# p mysterious_math('(4 * 3 + 2) / 7 - 1 = 1') # -> '(4 ? 3 ? 2) ? 7 ? 1 = 1'

# Exercise 5

# def danish(str)
#   str.sub(/\b(apple|blueberry|cherry)\b/, 'danish')
# end
#
# p danish('An apple a day keeps the doctor away')
#   # -> 'An danish a day keeps the doctor away'
#
# p danish('My favorite is blueberry pie')
# # -> 'My favorite is danish pie'
#
# p danish('The cherry of my eye')
# # -> 'The danish of my eye'
#
# p danish('apple. cherry. blueberry.')
# # -> 'danish. cherry. blueberry.'
#
# p danish('I love pineapple')
# # -> 'I love pineapple'

# Exercise 6

# def format_date(str)
#   return str unless str.match(/\A\d{4}-/)
#
#   year = str.match(/\A\d{4}-/)[0].chop
#   month_day = str.scan(/(-\d{2})/).flatten
#   month = month_day[0][1..2]
#   day = month_day[1][1..2]
#
#   "#{day}.#{month}.#{year}"
# end

# def format_date(str)
#   str.sub(/\A(\d{4})-(\d{2})-(\d{2})\z/, '\3.\2.\1' )
# end
#
# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2016/06/17') # -> '2016/06/17' (no change)

# Exercise 7

# def format_date(str)
#   str.sub(/\A(\d{4})([-\/])(\d{2})\2(\d{2})\z/, '\4.\3.\1' )
# end
#
# p format_date('2016-06-17') # -> '17.06.2016'
# p format_date('2017/05/03') # -> '03.05.2017'
# p format_date('2015/01-31') # -> '2015/01-31' (no change)
