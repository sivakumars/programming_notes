#
class PigLatin
  DOUBLE_CONSONANTS = %w(ch qu th).freeze
  TRIPLE_CONSONANTS = %w(thr sch).freeze

  def self.translate(phrase)
    phrase.split.map { |word| translate_word(word) }.join(' ')
  end

  def self.translate_word(word)
    if word[0].match(/[aeiou]/) ||
       word[0] == 'y' && word[1].match(/[^aeiou]/) ||
       word[0..1] == 'xr'
      word
    elsif TRIPLE_CONSONANTS.include?(word[0..2]) ||
          (word[0].match(/[^aeiou]/) && word[1..2] == 'qu')
      word[3..-1] << word[0..2]
    elsif DOUBLE_CONSONANTS.include?(word[0..1])
      word[2..-1] << word[0..1]
    else
      word[1..-1] << word[0]
    end << 'ay'
  end
end
