=begin

Consider a character set consisting of letters, a space, and a point. Words
consist of one or more, but at most 20 letters. As input, text consists of one
or more words separated from each other by one or more spaces and terminated by
0 or more spaces followed by a point. Input should be read from, and including,
the first letter of the first word, up to and including the terminating
point. The output text is to be produced such that successive words are
separated by a single space with the last word being terminated by a single
point. Odd words are copied in reverse order while even words are merely
echoed. For example, the input string:

"whats the matter with kansas." --> "what's eht matter htiw kansas."

BONUS POINTS: the characters must be read and printed one at a time.

Input: string
Output: string
Rules:
- input is letters, spaces, or periods. input is at least one word. input ends in period.
- each word is up to 20 letters
- output words should be separated by single space
- last word in output should always end with a period
- odd words are reversed
- even words are echoed

=end

def odd_words_reverse(sentence)
  sentence.chop! if sentence[-1] == "."
  sentence.split.map.with_index do |word, idx|
    idx.odd? ? word.reverse : word
  end.join(' ') + '.'
end

sentence1 = "whats the matter with kansas today."

puts odd_words_reverse(sentence1)
