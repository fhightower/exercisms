class SumOfMultiples
  attr_reader :integers

  def to(max_integer)
    1.upto(max_integer - 1).select { |counter| integers.any? { |int| multiple?(numerator: counter, denominator: int) } }.sum
  end

  private

  def initialize(*integers)
    @integers = integers
  end

  def multiple?(numerator:, denominator:)
    (numerator % denominator).zero?
  end
end

