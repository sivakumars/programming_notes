#
class BeerSong
  def verse(num)
    result = ''
    case num
    when (3..99)
      result += "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottles of beer on the wall.\n"
    when 2
      result += "#{num} bottles of beer on the wall, #{num} bottles of beer.\n" \
        "Take one down and pass it around, #{num - 1} bottle of beer on the wall.\n"
    when 1
      result += "#{num} bottle of beer on the wall, #{num} bottle of beer.\n" \
        "Take it down and pass it around, no more bottles of beer on the wall.\n"
    when 0
      result += "No more bottles of beer on the wall, no more bottles of beer.\n" \
        "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
    result
  end

  def verses(num1, num2)
    result = ''
    (num2..num1).reverse_each.with_index do |num, idx|
      result += "\n" unless idx.zero?
      result += verse(num)
    end
    result
  end

  def lyrics
    verses(99, 0)
  end
end
