class BoutiqueInventory
  CHEAP_THRESHOLD = 30

  def initialize(items)
    @items = items
  end

  def item_names
    items.map { |item| item[:name] }.sort
  end

  def cheap
    items.select { |item| item[:price] < CHEAP_THRESHOLD }
  end

  def out_of_stock
    items.select { |item| item[:quantity_by_size].empty? or item[:quantity_by_size].any? { |_, quantity| quantity.zero? }}
  end

  def stock_for_item(name)
    items.find { |item| item[:name] == name }[:quantity_by_size]
  end

  def total_stock
    items.sum {|item| item[:quantity_by_size].values.sum }
  end

  private
  attr_reader :items
end
