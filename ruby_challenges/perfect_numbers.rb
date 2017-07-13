class PerfectNumber
  def self.classify(number)
    raise RuntimeError if number <= 0

    sum_of_factors = find_factors(number).reduce(:+)
    if sum_of_factors == number
      "perfect"
    elsif sum_of_factors > number
      "abundant"
    else
      "deficient"
    end
  end

  def self.find_factors(number)
    factors = [1]
    2.upto(number/2) do |num|
      factors << num if number % num == 0
    end
    factors
  end
end


=begin
Input:
- Write a method to list factors of a number
  - Loop from 2 up to num
  - if number is equally divisible, add it to result array
- Add the factors up
- check if they're equal, less than, or greater than


=end
