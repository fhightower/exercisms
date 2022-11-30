class String
  def anagram?(possible_anagram)
    return false unless self.length == possible_anagram.length
    return false unless self != possible_anagram

    self.chars.uniq.all? { |c| self.count(c) == possible_anagram.count(c) }
  end
end

class Anagram
  attr_reader :target

  def initialize(target)
    @target = target.downcase
  end

  def match(possible_anagrams)
    possible_anagrams.select { |word| word.downcase.anagram?(target) }
  end
end

