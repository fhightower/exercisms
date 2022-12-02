module ExtendedString
  refine String do
    def anagram_of?(possible_anagram)
      return false unless self.length == possible_anagram.length

      downcased_possible_anagram = possible_anagram.downcase
      downcased_self = self.downcase

      return false unless downcased_self != downcased_possible_anagram
      downcased_self.chars.sort == downcased_possible_anagram.chars.sort
    end
  end
end

using ExtendedString

class Anagram
  attr_reader :target

  def initialize(target)
    @target = target
  end

  def match(possible_anagrams)
    possible_anagrams.select { |word| word.anagram_of?(target) }
  end
end

