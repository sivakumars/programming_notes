class Phrase
  def initialize(phrase)
    @phrase = phrase
  end

  def word_count
    result = {}
    valid_words.each do |word|
      result[word] = valid_words.count(word)
    end
    result
  end

  private

  def valid_words
    words = @phrase.split(",").map(&:split).flatten

    words.map! do |word|
      if word.chars.first == "'" && word.chars.last == "'"
        word[1..-2]
      else
        word
      end
    end

    words.map do |word|
      word.downcase.chars.select do |char|
        char =~ /[a-z'0-9]/
      end.join
    end.reject(&:empty?)
  end
end

=begin
Input: string of words
Output: hash with each word as a key and number of times that words appears as value
Steps:
- create output hash with words as keys and values as 1
- iterate through words
  -

=end
