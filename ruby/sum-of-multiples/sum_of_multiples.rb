class SumOfMultiples
  attr_reader :nums

  def initialize(*nums)
    @nums = nums
  end

  def to(num)
    nums.map { |n| multiples(multiples_of: n, up_to: num - 1) }.flatten.uniq.sum
  end

  private

  def multiples(multiples_of:, up_to:)
    (1..up_to).select { |n| multiple?(numerator: n, denominator: multiples_of) }
  end

  def multiple?(numerator:, denominator:)
    numerator.modulo(denominator).zero?
  end
end
