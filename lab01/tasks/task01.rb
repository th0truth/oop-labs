# frozen_string_literal: true

require_relative '../task'
require_relative '../input_helper'

class Task01 < Task
  def title
    'Tabulate f(x) = x^2 (Range & Stats)'
  end

  def execute
    puts 'Tabulation of f(x) = x^2'

    xmin = InputHelper.read_float('Enter xmin: ')
    xmax = InputHelper.read_float('Enter xmax: ')

    if xmin > xmax
      puts "Notice: xmin (#{xmin}) > xmax (#{xmax}). Swapping values."
      xmin, xmax = xmax, xmin
    end

    dx = InputHelper.read_positive_float('Enter step dx (> 0): ')

    points = calculate(xmin, xmax, dx)
    display_table(points)

    stats = compute_statistics(points)
    display_statistics(stats)
  end

  private

  def calculate(xmin, xmax, dx)
    points = []
    x = xmin

    while x <= xmax + 1e-9
      points << { x: x.round(6), y: (x**2).round(6) }
      x += dx
    end

    if points.any? && (points.last[:x] - xmax).abs > 1e-9
      points << { x: xmax.round(6), y: (xmax**2).round(6) }
    end

    points
  end

  def compute_statistics(points)
    y_values = points.map { |p| p[:y] }

    {
      total: points.size,
      min: y_values.min,
      max: y_values.max,
      avg: y_values.sum / y_values.size.to_f,
      positive: y_values.count(&:positive?),
      negative: y_values.count(&:negative?),
      zero: y_values.count(&:zero?)
    }
  end

  def display_table(points)
    puts "\n+------------+------------+"
    puts '|     x      |    f(x)    |'
    puts '+------------+------------+'

    points.each do |p|
      puts sprintf('| %10.2f | %10.2f |', p[:x], p[:y])
    end

    puts '+------------+------------+'
  end

  def display_statistics(stats)
    puts "\n--- Statistics (Sufficient Level) ---"
    puts sprintf('Points calculated: %d', stats[:total])
    puts sprintf('Minimum value:     %10.2f', stats[:min])
    puts sprintf('Maximum value:     %10.2f', stats[:max])
    puts sprintf('Average value:     %10.2f', stats[:avg])
    puts sprintf('Positive values:   %d', stats[:positive])
    puts sprintf('Negative values:   %d', stats[:negative])
    puts sprintf('Zero values:       %d', stats[:zero])
  end
end
