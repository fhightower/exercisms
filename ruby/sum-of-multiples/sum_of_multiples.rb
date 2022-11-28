class Integer
  def multiple_of?(integer)
    return (self % integer).zero?
  end
end

class SumOfMultiples
  attr_reader :integers

  def initialize(*integers)
    @integers = integers
  end

  def to(integer)
    1.upto(integer - 1).sum { |counter| integers.any? { |int| counter.multiple_of?(int) } ? counter : 0 }
  end
end

