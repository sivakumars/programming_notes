## Exercise 1

# class Tree
#   include Enumberable
#
#   def each
#   end
# end

## Exercise 2

# def compute
#   block_given? ? yield : 'Does not compute.'
# end
#
# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

## Exercise 3
#
# def missing(array)
#   (array.min..array.max).to_a - array
# end
#
# p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
# p missing([1, 2, 3, 4]) == []
# p missing([1, 5]) == [2, 3, 4]
# p missing([6]) == []

## Exercise 4

# def divisors(number)
#   1.upto(number/2).select { |num| number % num == 0 } << number
# end
#
# p divisors(1) == [1]
# p divisors(7) == [1, 7]
# p divisors(12) == [1, 2, 3, 4, 6, 12]
# p divisors(98) == [1, 2, 7, 14, 49, 98]
# p divisors(99400891) == [1, 9967, 9973, 99400891]

## Exercise 5

# ENCRYPTED_NAMES = ['Nqn Ybirynpr',
# 'Tenpr Ubccre',
# 'Nqryr Tbyqfgvar',
# 'Nyna Ghevat',
# 'Puneyrf Onoontr',
# 'Noqhyynu Zhunzznq ova Zhfn ny-Xujnevmzv',
# 'Wbua Ngnanfbss',
# 'Ybvf Unyog',
# 'Pynhqr Funaaba',
# 'Fgrir Wbof',
# 'Ovyy Tngrf',
# 'Gvz Orearef-Yrr',
# 'Fgrir Jbmavnx',
# 'Xbaenq Mhfr',
# 'Wbua Ngnanfbss',
# 'Fve Nagbal Ubner',
# 'Zneiva Zvafxl',
# 'Lhxvuveb Zngfhzbgb',
# 'Unllvz Fybavzfxv',
# 'Tregehqr Oynapu'].freeze
#
# LOWERS = ('a'..'z').to_a
# UPPERS = ('A'..'Z').to_a
#
# def rot13(full_name)
#   full_name.split.map {|name| rotate_word(name)}.join(' ')
# end
#
# def rotate_word(word)
#   word.chars.map do |char|
#     if char =~ /[a-z]/
#       LOWERS[LOWERS.index(char) - 13]
#     elsif char =~ /[A-Z]/
#       UPPERS[UPPERS.index(char) - 13]
#     else
#       char
#     end
#   end.join
# end
#
# ENCRYPTED_NAMES.each do |encrypted_name|
#   puts rot13(encrypted_name)
# end

## Exercise 6

# def any?(array)
#   array.each do |element|
#     return true if yield(element)
#   end
#   false
# end
#
# p any?([1, 3, 5, 6]) { |value| value.even? } == true
# p any?([1, 3, 5, 7]) { |value| value.even? } == false
# p any?([2, 4, 6, 8]) { |value| value.odd? } == false
# p any?([1, 3, 5, 7]) { |value| value % 5 == 0 } == true
# p any?([1, 3, 5, 7]) { |value| true } == true
# p any?([1, 3, 5, 7]) { |value| false } == false
# p any?([]) { |value| true } == false

## Exercise 7

# def all?(collection)
#   collection.each do |item|
#     return false unless yield(item)
#   end
#   true
# end
#
# p all?([1, 3, 5, 6]) { |value| value.odd? } == false
# p all?([1, 3, 5, 7]) { |value| value.odd? } == true
# p all?([2, 4, 6, 8]) { |value| value.even? } == true
# p all?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p all?([1, 3, 5, 7]) { |value| true } == true
# p all?([1, 3, 5, 7]) { |value| false } == false
# p all?([]) { |value| false } == true

## Exercise 8

# def none?(collection)
#   collection.each do |item|
#     return false if yield(item)
#   end
#   true
# end

# p none?([1, 3, 5, 6]) { |value| value.even? } == false
# p none?([1, 3, 5, 7]) { |value| value.even? } == true
# p none?([2, 4, 6, 8]) { |value| value.odd? } == true
# p none?([1, 3, 5, 7]) { |value| value % 5 == 0 } == false
# p none?([1, 3, 5, 7]) { |value| true } == false
# p none?([1, 3, 5, 7]) { |value| false } == true
# p none?([]) { |value| true } == true

## Exercise 9
#
# def one?(collection)
#   matches = 0
#   collection.each do |item|
#     matches += 1 if yield(item)
#     return false if counter > 1
#   end
#   matches == 1
# end
#
# p one?([1, 3, 5, 6]) { |value| value.even? }    # -> true
# p one?([1, 3, 5, 7]) { |value| value.odd? }     # -> false
# p one?([2, 4, 6, 8]) { |value| value.even? }    # -> false
# p one?([1, 3, 5, 7]) { |value| value % 5 == 0 } # -> true
# p one?([1, 3, 5, 7]) { |value| true }           # -> false
# p one?([1, 3, 5, 7]) { |value| false }          # -> false
# p one?([]) { |value| true }                     # -> false

## Exercise 10

# def count(collection)
#   counter = 0
#   collection.each do |item|
#     counter += 1 if yield(item)
#   end
#   counter
# end
#
# p count([1,2,3,4,5]) { |value| value.odd? } == 3
# p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
# p count([1,2,3,4,5]) { |value| true } == 5
# p count([1,2,3,4,5]) { |value| false } == 0
# p count([]) { |value| value.even? } == 0
# p count(%w(Four score and seven)) { |value| value.size == 5 } == 2
