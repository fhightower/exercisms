COST_PER_BOOK = 8
DISCOUNT_MAP = {
  0 => 0,
  1 => 0,
  2 => 0.05,
  3 => 0.10,
  4 => 0.20,
  5 => 0.25,
}

class BookStore
  def self.calculate_price(basket)
    print basket
    puts

    if basket.empty?
      return 0
    end

    distinct_books = basket.uniq
    discount = DISCOUNT_MAP[distinct_books.length]
    price = distinct_books.length * COST_PER_BOOK * (1 - discount)
    price += self.calculate_price(self.remove_series(basket, distinct_books))
  end

  private

  def self.remove_series(basket, series)
    series.each { |item| basket.delete_at(basket.index(item)) }
    basket
  end
end

=begin
l = [1, 1, 2, 2, 3, 3, 4, 5]
u = l.uniq
# todo find these at different lengths
c = u.combination([5, u.length].min).find_all { |i| i.uniq.length == i.length }

def find_remaining(full, partial)
  partial.each do |i|
    full.delete_at(full.index(i))
  end
  full
end

# todo remaining would have to be passed back through this function
r = c.map { |i| [i, find_remaining(l, i)] }

def calculate_cost(basket)
  # todo: implement
  print basket
end

costs = r.map { |basket| calculate_cost(basket) }
=end
