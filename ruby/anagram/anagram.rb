class String
  def anagram_of?(possible_anagram)
    return false unless self.length == possible_anagram.length
    return false unless self != possible_anagram
    self.chars.sort == possible_anagram.chars.sort
  end
end

class Anagram
  attr_reader :target

  def initialize(target)
    @target = clean(target)
  end

  def match(possible_anagrams)
    possible_anagrams.select { |word| clean(word).anagram_of?(target) }
  end

  private

  def clean(string)
    string.downcase
  end
end

