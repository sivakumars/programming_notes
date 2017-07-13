# Extending the Integer class with a 'to_roman' method
class Integer
  DECIMAL = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1].freeze
  ROMAN = %w(M CM D CD C XC L XL X IX V IV I).freeze

  def to_roman
    result = ''
    number = self

    DECIMAL.each_with_index do |num, idx|
      while number >= num
        result << ROMAN[idx]
        number -= num
      end
    end
    result
    # while number > 0
    #   if number >= 1000
    #     roman += "M"
    #     number -= 1000
    #   elsif number >= 900
    #     roman += "CM"
    #     number -= 900
    #   elsif number >= 500
    #     roman += "D"
    #     number -= 500
    #   elsif number >= 400
    #     roman += "CD"
    #     number -= 400
    #   elsif number >= 100
    #     roman += "C"
    #     number -= 100
    #   elsif number >= 90
    #     roman += "XC"
    #     number -= 90
    #   elsif number >= 50
    #     roman += "L"
    #     number -= 50
    #   elsif number >= 40
    #     roman += "XL"
    #     number -= 40
    #   elsif number >= 10
    #     roman += "X"
    #     number -= 10
    #   elsif number >= 9
    #     roman += "IX"
    #     number -= 9
    #   elsif number >= 5
    #     roman += "V"
    #     number -= 5
    #   elsif number >= 4
    #     roman += "IV"
    #     number -= 4
    #   else
    #     roman += "I"
    #     number -= 1
    #   end
    # end
    # roman
  end
end
