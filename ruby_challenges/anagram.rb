class Anagram
  def initialize(word)
    @word = word.downcase
  end

  def match(candidates)
    letters = @word.chars.sort
    candidates.select do |cand|
      (@word != cand.downcase) && (letters == cand.downcase.chars.sort)
    end
  end
end

=begin
Input: word
Output: array of words

Steps:
- Split input into array of characters and sort
- Iterate through candidates array
  - split and sort each word
  - if there is a match, select it
=end
