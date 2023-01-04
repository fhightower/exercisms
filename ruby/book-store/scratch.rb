# old stuff
def find_cost(array)
  u = array.uniq
  if u == array
    return u.length * 8
  end

  combos = u.length.downto(2).map{|i| u.combination(i)}
  r = combos.map { |combo| find_cost(combo) + find_cost(find_remaining(array, combos)) }
  print r
  r
end

# end old stuff

def has_unique_elements?(array)
  array.uniq.length == array.length
end

def find_collections(array)
  collections = []
  # minimum_length = array.length == 2 ? 1 : 2
  (1..array.length).each do |length|
    new_collections = array.combination(length).filter { |collection| has_unique_elements?(collection) }.uniq
    collections.append(new_collections)
  end
  collections.flatten(1)
end

def find_remaining(full, partial)
  copy = full[0 .. full.length]
  partial.each do |i|
    copy.delete_at(copy.index(i))
  end
  copy
end

def main(array)
  possible_collections = []
  find_collections(array).map do |collection|
    printf("%s\n", collection)
    remaining = find_remaining(array, collection)
    printf("%s\n", remaining)
    r = find_collections(remaining)
    printf("%s\n", r)
    puts
    # todo: create list of new collections with collection and all of the possible collections based on the remaining (stored in the variable r)
    possible_collections.append(...)
  end
  printf("%s\n", possible_collections)
end

