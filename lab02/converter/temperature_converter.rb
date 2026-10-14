# frozen_string_literal: true

class TemperatureConverter
  def celsius_to_fahrenheit(celsius)
    (celsius * 9.0 / 5.0) + 32.0
  end

  def fahrenheit_to_celsius(fahrenheit)
    (fahrenheit - 32.0) * 5.0 / 9.0
  end

  def celsius_to_kelvin(celsius)
    celsius + 273.15
  end

  def kelvin_to_celsius(kelvin)
    kelvin - 273.15
  end

  def fahrenheit_to_kelvin(fahrenheit)
    celsius_to_kelvin(fahrenheit_to_celsius(fahrenheit))
  end

  def kelvin_to_fahrenheit(kelvin)
    celsius_to_fahrenheit(kelvin_to_celsius(kelvin))
  end
end
