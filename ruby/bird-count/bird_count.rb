class BirdCount
  BUSY_DAY_MIN = 5

  def self.last_week
    [0, 2, 5, 3, 7, 8, 4]
  end

  def initialize(birds_per_day)
    @weeks_birds = birds_per_day
  end

  def yesterday
    @weeks_birds[-2]
  end

  def total
    @weeks_birds.sum
  end

  def busy_days
    @weeks_birds.count {|e| e >= BUSY_DAY_MIN}
  end

  def day_without_birds?
    @weeks_birds.any? {|e| e.zero?}
  end
end
