# frozen_string_literal: true

module InputHelper
  module_function

  def read_line(prompt, allow_empty: false)
    loop do
      print prompt
      input = $stdin.gets
      exit(0) if input.nil?

      trimmed = input.strip
      return trimmed if allow_empty || !trimmed.empty?

      puts "Error: Input cannot be empty. Try again."
    end
  end

  def read_int(prompt)
    loop do
      raw = read_line(prompt)
      return Integer(raw)
    rescue ArgumentError
      puts "Error: Please enter a valid integer."
    end
  end

  def read_int_in_range(prompt, min, max)
    loop do
      val = read_int(prompt)
      return val if val.between?(min, max)

      puts "Error: Value must be between #{min} and #{max}."
    end
  end

  def read_float(prompt)
    loop do
      raw = read_line(prompt).tr(',', '.')
      return Float(raw)
    rescue ArgumentError
      puts "Error: Please enter a valid number (e.g. 1.5 or -2)."
    end
  end

  def read_positive_float(prompt)
    loop do
      val = read_float(prompt)
      return val if val.positive?

      puts "Error: Value must be strictly greater than 0."
    end
  end

  def pause
    puts "\nPress Enter to continue..."
    $stdin.gets
  end
end
