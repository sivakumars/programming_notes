# Calculates scrabble word scores
class Scrabble
  LETTER_VALUE = { 1 => %w(A E I O U L N R S T), 2 => %w(D G), 3 => %w(B C M P),
             4 => %w(F H V W Y), 5 => %w(K), 8 => %w(J X),
             10 => %w(Q Z) }.freeze

  def self.score(word)
    return 0 if word.nil? || word.match(/[^a-zA-Z]/)

    result = 0
    word.upcase.chars.each do |char|
      LETTER_VALUE.each do |score, letters|
        result += score if letters.include?(char)
      end
    end
    result
  end

  def initialize(word)
    @word = word
  end

  def score
    self.class.score(@word)
  end
end

=begin
Input: word
Output: number
Rules:
- empty input, nil input, non-alpha input should return 0 score
- call method on class or object

Steps:
- if input contains non-letters, return 0
- iterate through each character and add corresponding score
=end
