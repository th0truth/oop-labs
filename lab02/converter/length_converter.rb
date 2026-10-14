# frozen_string_literal: true

class LengthConverter
  METERS_TO_FEET = 3.28084
  KM_TO_MILES = 0.621371

  def meters_to_feet(meters)
    meters * METERS_TO_FEET
  end

  def feet_to_meters(feet)
    feet / METERS_TO_FEET
  end

  def kilometers_to_miles(km)
    km * KM_TO_MILES
  end

  def miles_to_kilometers(miles)
    miles / KM_TO_MILES
  end
end
