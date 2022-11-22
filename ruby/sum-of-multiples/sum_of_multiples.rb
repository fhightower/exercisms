class SumOfMultiples
  attr_reader :integers

  def to(max_integer)
    integers.map { |i| multiples_up_to(multiples_of: i, max_integer: max_integer - 1) }.flatten.uniq.sum
  end

  private

  def initialize(*integers)
    @integers = integers
  end

  def multiples_up_to(multiples_of:, max_integer:)
    1.upto(max_integer).select { |n| multiple?(numerator: n, denominator: multiples_of) }
  end

  def multiple?(numerator:, denominator:)
    (numerator % denominator).zero?
  end
end
