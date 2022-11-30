class String
  def anagram_of?(possible_anagram)
    return false unless self.length == possible_anagram.length
    return false unless self != possible_anagram
    self.chars.sort == possible_anagram.chars.sort
  end

  def clean
    return self.downcase
  end
end

class Anagram
  attr_reader :target

  def initialize(target)
    @target = target.clean
  end

  def match(possible_anagrams)
    possible_anagrams.select { |word| word.clean.anagram_of?(target) }
  end
end

