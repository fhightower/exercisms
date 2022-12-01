module ExtendedInteger
  refine Integer do
    def multiple_of?(integer)
      (self % integer).zero?
    end
  end
end

using ExtendedInteger

class SumOfMultiples
  attr_reader :integers

  def initialize(*integers)
    @integers = integers
  end

  def to(integer)
    (1..integer - 1).sum do |counter|
      integers.any? { |int| counter.multiple_of?(int) } ? counter : 0
    end
  end
end

