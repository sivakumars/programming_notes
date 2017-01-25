class SumOfMultiples
  def self.to(number)
    SumOfMultiples.new(3,5).to(number)
  end

  def initialize(*divisors)
    @divisors = *divisors
  end

  def to(number)
    result = []
    0.upto(number - 1) do |num|
      @divisors.each do |multiple|
        result << num if num % multiple == 0
      end
    end
    result.uniq.reduce(:+)
  end
end

=begin

Input: number
Output: sum of multiples of particular numbers up to input number

Steps:
- Loop from 1 upto input number
- if current iteration % 3 or % 5 == 0, add to result
- return results



=end
