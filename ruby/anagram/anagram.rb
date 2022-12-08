class Anagram
  attr_reader :target, :downcased_word, :sorted_downcased_chars

  def initialize(target)
    @target = target
    @downcased_word = target.downcase
    @sorted_downcased_chars = downcased_word.chars.sort
  end

  def match(candidates)
    candidates.select { |candidate| is_anagram? candidate }
  end

  private

  def is_anagram?(candidate)
    downcased_candidate = candidate.downcase
    return false unless downcased_candidate.length == downcased_word.length
    return false unless downcased_candidate != downcased_word
    sorted_downcased_chars == downcased_candidate.chars.sort
  end
end

