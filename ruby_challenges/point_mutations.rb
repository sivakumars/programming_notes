class DNA
  def initialize(initial_string)
    @initial_string = initial_string
  end

  def hamming_distance(string)
    distance = 0
    short_string, long_string = [@initial_string, string].sort_by(&:length)
    short_string.chars.each_with_index do |char, idx|
      distance += 1 unless char == long_string[idx]
    end
    distance
  end
end

=begin
Input: two strings
Output: number

Steps:
- compare each character of a strings
- if there is a difference, add 1 to distance

=end
