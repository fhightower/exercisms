STRING_FOR_ME = 'one for me.'

class TwoFer
  def self.two_fer(name = nil)
    if (name == nil)
      name = "you"
    end
    "One for #{name}, #{STRING_FOR_ME}"
  end
end

