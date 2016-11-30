## Exercise 1

# SENTENCE_ENDERS = ['.', '!', '?'].freeze
#
# text = File.read("test.txt")
#
# locations = [0]
# text.chars.each_with_index do |char, index|
#   locations << index if SENTENCE_ENDERS.include?(char)
# end
#
# sentences = []
# start_location = 0
# locations.each do |location|
#   sentences << text[start_location..location]
#   start_location = location + 1
# end
#
# word_counts = []
# sentences.each do |sentence|
#   word_counts << sentence.split.length
# end
# longest_sentence = sentences[word_counts.index(word_counts.max)]
# max_length = word_counts.max
#
# puts "#{longest_sentence}"
# puts "Containing #{max_length} words"

# text = File.read("test.txt")
#
# sentences = text.split(/\.|\?|!/)
#
# largest_sentence = sentences.max_by { |sentence| sentence.split.size }
# number_of_wods = largest_sentence.split.size

# puts "#{longest_sentence}"
# puts "Containing #{max_length} words"

## Exercise 2

def block_word?(word)
  blocks = [ ['B', 'O'], ['G', 'T'], ['V', 'I'], ['X', 'K'], ['R', 'E'], ['L', 'Y'], ['D', 'Q'], ['F', 'S'], ['Z', 'M'], ['C', 'P'], ['J', 'W'], ['N', 'A'], ['H', 'U'] ]
  word.upcase.each_char do |char|
    if blocks.flatten.include?(char)
      blocks.each { |block| blocks.delete(block) if block.include?(char) }
    else
      return false
    end
  end
  true
end

puts block_word?('BATCH')
puts block_word?('BUTCH')
puts block_word?('jest')
