class SumOfMultiples
  attr_reader :integers

  def to(to_integer)
    integers.map { |i| multiples(multiples_of: i, up_to: to_integer - 1) }.flatten.uniq.sum
  end

  private

  def initialize(*integers)
    @integers = integers
  end

  def multiples(multiples_of:, up_to:)
    (1..up_to).select { |n| multiple?(numerator: n, denominator: multiples_of) }
  end

  def multiple?(numerator:, denominator:)
    (numerator % denominator).zero?
  end
end
