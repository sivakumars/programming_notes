class Octal
  attr_reader :octal

  def initialize(digits)
    @octal = test_valid_input(digits)
  end

  def to_decimal
    decimal = 0
    1.upto(octal.length) do |num|
      decimal += (octal[-num].to_i * 8 ** (num-1))
    end
    decimal
  end

  private

  def test_valid_input(digits)
    digits =~ /[a-zA-Z8-9]/ ? "0" : digits
  end
end
