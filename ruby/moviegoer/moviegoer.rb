# This is a custom exception that you can use in your code
class NotMovieClubMemberError < RuntimeError
end

class Moviegoer
  SENIOR_DISCOUNT_MIN_AGE = 60
  SCARY_MOVIE_MIN_AGE = 18

  def initialize(age, member: false)
    @age = age
    @member = member
  end

  def ticket_price
    @age >= SENIOR_DISCOUNT_MIN_AGE ? 10 : 15
  end

  def watch_scary_movie?
    @age >= SCARY_MOVIE_MIN_AGE
  end

  # Popcorn is 🍿
  def claim_free_popcorn!
    raise NotMovieClubMemberError.new('Sorry, but you\'re not a member... become a member for free popcorn.') unless @member
    '🍿'
  end
end
