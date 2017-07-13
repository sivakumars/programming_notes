class Trinary
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def to_decimal
    return 0 if number.match(/[^0-2]/)

    result = 0
    number.chars.reverse.map(&:to_i).each_with_index do |digit, index|
      result += digit * 3 ** index
    end
    result
  end
end

puts "n"
