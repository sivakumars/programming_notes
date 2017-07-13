#
class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    @number.to_s.chars.reverse.map.with_index do |num, idx|
      if idx.odd?
        doubled = num.to_i * 2
        doubled >= 10 ? doubled - 9 : doubled
      else
        num.to_i
      end
    end.reverse
  end

  def checksum
    addends.reduce(:+)
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(num)
    num_append_zero = new(num * 10)

    if num_append_zero.valid?
      num * 10
    else
      num_append_zero.number + (10 - num_append_zero.checksum % 10)
    end
  end
end
