class AssemblyLine
  BASE_PRODUCTION_MULTIPLE = 221

  def initialize(speed)
    # todo: I would add some validation for speed here...
    @speed = speed
    @error_rate = get_error_rate
    @rate_per_hour = production_rate_per_hour
  end

  def production_rate_per_hour
    @rate_per_hour ||= (BASE_PRODUCTION_MULTIPLE * @speed) * @error_rate
  end

  def working_items_per_minute
    (@rate_per_hour / 60).floor
  end

  private

  def get_error_rate
    return 0.77 if @speed == 10
    return 0.8 if @speed == 9
    return 0.9 if @speed >= 5
    1
  end
end
