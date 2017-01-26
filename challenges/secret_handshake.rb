#
class SecretHandshake
  SECRET_CODE = ['wink', 'double blink', 'close your eyes', 'jump',
                 'reverse'].freeze

  def initialize(input)
    @input = input
    @binary = convert_to_binary
  end

  def commands
    result = SECRET_CODE.select.with_index do |_, idx|
      @binary.reverse[idx] == '1'
    end
    result.last == 'reverse' ? result[0..-2].reverse : result
  end

  # def commands
  #   reverse = true
  #   result = []
  #   while @binary > 0
  #     if @binary >= 10_000
  #       reverse = false
  #       @binary -= 10_000
  #     elsif @binary >= 1000
  #       result << 'jump'
  #       @binary -= 1000
  #     elsif @binary >= 100
  #       result << 'close your eyes'
  #       @binary -= 100
  #     elsif @binary >= 10
  #       result << 'double blink'
  #       @binary -= 10
  #     else
  #       result << 'wink'
  #       @binary -= 1
  #     end
  #   end
  #   reverse ? result.reverse : result
  # end

  def convert_to_binary
    @input.class == String ? @input : @input.to_s(2)
  end
end
