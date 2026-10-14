# frozen_string_literal: true

require_relative 'temperature_converter'
require_relative 'length_converter'
require_relative 'weight_converter'

class ConverterMenu
  def self.run(history = nil)
    temp_conv = TemperatureConverter.new
    length_conv = LengthConverter.new
    weight_conv = WeightConverter.new

    loop do
      puts "\n#{'=' * 50}"
      puts 'PROGRAM 2: UNIT CONVERTER'.center(50)
      puts '=' * 50
      puts '1. Temperature (Celsius, Fahrenheit, Kelvin)'
      puts '2. Length (Meters, Feet, Kilometers, Miles)'
      puts '3. Weight (Kilograms, Pounds, Grams, Ounces)'
      puts '0. Return to Main Menu'
      puts '=' * 50
      print 'Your choice: '

      choice = $stdin.gets&.strip

      case choice
      when '1'
        convert_temperature(temp_conv, history)
      when '2'
        convert_length(length_conv, history)
      when '3'
        convert_weight(weight_conv, history)
      when '0'
        break
      else
        puts 'Invalid choice! Please select 0, 1, 2, or 3.'
      end
    end
  end

  private_class_method

  def self.read_number(prompt)
    loop do
      print prompt
      input = $stdin.gets&.strip
      exit(0) if input.nil?

      cleaned = input.tr(',', '.')
      return Float(cleaned)
    rescue ArgumentError
      puts 'Error: Please enter a valid decimal number.'
    end
  end

  def self.convert_temperature(conv, history)
    puts "\n--- Temperature Conversion ---"
    puts '1. Celsius -> Fahrenheit & Kelvin'
    puts '2. Fahrenheit -> Celsius & Kelvin'
    puts '3. Kelvin -> Celsius & Fahrenheit'
    print 'Choice (1-3): '
    sub_choice = $stdin.gets&.strip

    case sub_choice
    when '1'
      c = read_number('Enter temperature in Celsius (°C): ')
      f = conv.celsius_to_fahrenheit(c)
      k = conv.celsius_to_kelvin(c)
      puts sprintf('%.2f°C = %.2f°F', c, f)
      puts sprintf('%.2f°C = %.2fK', c, k)
      history&.add('Temperature', sprintf('%.2f°C = %.2f°F = %.2fK', c, f, k))
    when '2'
      f = read_number('Enter temperature in Fahrenheit (°F): ')
      c = conv.fahrenheit_to_celsius(f)
      k = conv.fahrenheit_to_kelvin(f)
      puts sprintf('%.2f°F = %.2f°C', f, c)
      puts sprintf('%.2f°F = %.2fK', f, k)
      history&.add('Temperature', sprintf('%.2f°F = %.2f°C = %.2fK', f, c, k))
    when '3'
      k = read_number('Enter temperature in Kelvin (K): ')
      c = conv.kelvin_to_celsius(k)
      f = conv.kelvin_to_fahrenheit(k)
      puts sprintf('%.2fK = %.2f°C', k, c)
      puts sprintf('%.2fK = %.2f°F', k, f)
      history&.add('Temperature', sprintf('%.2fK = %.2f°C = %.2f°F', k, c, f))
    else
      puts 'Invalid option.'
    end
  end

  def self.convert_length(conv, history)
    puts "\n--- Length Conversion ---"
    puts '1. Meters -> Feet, Kilometers, Miles'
    puts '2. Feet -> Meters'
    puts '3. Kilometers -> Miles'
    puts '4. Miles -> Kilometers'
    print 'Choice (1-4): '
    sub_choice = $stdin.gets&.strip

    case sub_choice
    when '1'
      meters = read_number('Enter value in meters: ')
      feet = conv.meters_to_feet(meters)
      km = meters / 1000.0
      miles = conv.kilometers_to_miles(km)
      puts sprintf('%.2f meters = %.2f feet', meters, feet)
      puts sprintf('%.2f meters = %.4f kilometers', meters, km)
      puts sprintf('%.4f kilometers = %.4f miles', km, miles)
      history&.add('Length', sprintf('%.2f m = %.2f ft = %.4f km = %.4f mi', meters, feet, km, miles))
    when '2'
      feet = read_number('Enter value in feet: ')
      meters = conv.feet_to_meters(feet)
      puts sprintf('%.2f feet = %.4f meters', feet, meters)
      history&.add('Length', sprintf('%.2f ft = %.4f m', feet, meters))
    when '3'
      km = read_number('Enter value in kilometers: ')
      miles = conv.kilometers_to_miles(km)
      puts sprintf('%.2f km = %.4f miles', km, miles)
      history&.add('Length', sprintf('%.2f km = %.4f mi', km, miles))
    when '4'
      miles = read_number('Enter value in miles: ')
      km = conv.miles_to_kilometers(miles)
      puts sprintf('%.2f miles = %.4f km', miles, km)
      history&.add('Length', sprintf('%.2f mi = %.4f km', miles, km))
    else
      puts 'Invalid option.'
    end
  end

  def self.convert_weight(conv, history)
    puts "\n--- Weight Conversion ---"
    puts '1. Kilograms -> Pounds'
    puts '2. Pounds -> Kilograms'
    puts '3. Grams -> Ounces'
    puts '4. Ounces -> Grams'
    print 'Choice (1-4): '
    sub_choice = $stdin.gets&.strip

    case sub_choice
    when '1'
      kg = read_number('Enter weight in kg: ')
      lbs = conv.kilograms_to_pounds(kg)
      puts sprintf('%.2f kg = %.2f lbs', kg, lbs)
      history&.add('Weight', sprintf('%.2f kg = %.2f lbs', kg, lbs))
    when '2'
      lbs = read_number('Enter weight in lbs: ')
      kg = conv.pounds_to_kilograms(lbs)
      puts sprintf('%.2f lbs = %.2f kg', lbs, kg)
      history&.add('Weight', sprintf('%.2f lbs = %.2f kg', lbs, kg))
    when '3'
      g = read_number('Enter weight in grams: ')
      oz = conv.grams_to_ounces(g)
      puts sprintf('%.2f g = %.2f oz', g, oz)
      history&.add('Weight', sprintf('%.2f g = %.2f oz', g, oz))
    when '4'
      oz = read_number('Enter weight in ounces: ')
      g = conv.ounces_to_grams(oz)
      puts sprintf('%.2f oz = %.2f g', oz, g)
      history&.add('Weight', sprintf('%.2f oz = %.2f g', oz, g))
    else
      puts 'Invalid option.'
    end
  end
end
