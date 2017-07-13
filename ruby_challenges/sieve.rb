class Sieve
  attr_reader :numbers

  def initialize(limit)
    @numbers = (2..limit).to_a
  end

  def primes
    numbers.each do |num|
      numbers.reject! { |multiple| (multiple != num) && (multiple % num == 0) }
    end
  end

  # def primes
  #   numbers = (2..limit).to_a
  #   index = 0
  #
  #   loop do
  #     prime_starting_number = numbers[index]
  #     break unless prime_starting_number
  #
  #     multiplier = 2
  #     loop do
  #       non_prime = multiplier * prime_starting_number
  #       numbers.delete(non_prime)
  #       multiplier += 1
  #       break if non_prime > limit
  #     end
  #
  #     index += 1
  #   end
  #   numbers
  # end
end
