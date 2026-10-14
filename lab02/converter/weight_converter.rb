# frozen_string_literal: true

class WeightConverter
  KG_TO_LBS = 2.20462
  GRAMS_TO_OZ = 0.035274

  def kilograms_to_pounds(kg)
    kg * KG_TO_LBS
  end

  def pounds_to_kilograms(lbs)
    lbs / KG_TO_LBS
  end

  def grams_to_ounces(grams)
    grams * GRAMS_TO_OZ
  end

  def ounces_to_grams(oz)
    oz / GRAMS_TO_OZ
  end
end
