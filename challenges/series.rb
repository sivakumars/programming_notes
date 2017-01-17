class Series
  attr_reader :digits

  def initialize(string_of_digits)
    @digits = string_of_digits.chars.map(&:to_i)
  end

  def slices(length)
    raise ArgumentError, "substring length must be smaller than string length" if length > digits.length

    slices = []
    index = 0
    while index <= digits.length - length
      slices << digits[index, length]
      index += 1
    end
    slices
  end
end
