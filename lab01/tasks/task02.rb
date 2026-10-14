# frozen_string_literal: true

require_relative '../task'
require_relative '../input_helper'

class Task02 < Task
  def title
    'Tabulate f(x1, x2) = x1^2 + e^x2 (Grid & Stats)'
  end

  def execute
    puts 'Tabulation of f(x1, x2) = x1^2 + e^x2'

    puts "\n--- Parameter x1 ---"
    x1min = InputHelper.read_float('Enter x1min: ')
    x1max = InputHelper.read_float('Enter x1max: ')
    if x1min > x1max
      puts "Notice: x1min > x1max. Swapping values (#{x1max} .. #{x1min})."
      x1min, x1max = x1max, x1min
    end
    dx1 = InputHelper.read_positive_float('Enter step dx1 (> 0): ')

    puts "\n--- Parameter x2 ---"
    x2min = InputHelper.read_float('Enter x2min: ')
    x2max = InputHelper.read_float('Enter x2max: ')
    if x2min > x2max
      puts "Notice: x2min > x2max. Swapping values (#{x2max} .. #{x2min})."
      x2min, x2max = x2max, x2min
    end
    dx2 = InputHelper.read_positive_float('Enter step dx2 (> 0): ')

    points = calculate_grid(x1min, x1max, dx1, x2min, x2max, dx2)
    display_table(points)

    stats = compute_statistics(points)
    display_statistics(stats)
  end

  private

  def calculate_grid(x1min, x1max, dx1, x2min, x2max, dx2)
    points = []
    x1 = x1min

    while x1 <= x1max + 1e-9
      x2 = x2min
      while x2 <= x2max + 1e-9
        y = (x1**2) + Math.exp(x2)
        points << { x1: x1.round(6), x2: x2.round(6), y: y.round(6) }
        x2 += dx2
      end
      x1 += dx1
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
    puts "\n+------------+------------+---------------+"
    puts '|     x1     |     x2     |   f(x1, x2)   |'
    puts '+------------+------------+---------------+'

    points.each do |p|
      puts sprintf('| %10.2f | %10.2f | %13.4f |', p[:x1], p[:x2], p[:y])
    end

    puts '+------------+------------+---------------+'
  end

  def display_statistics(stats)
    puts "\n--- Statistics (Sufficient Level) ---"
    puts sprintf('Grid points calculated: %d', stats[:total])
    puts sprintf('Minimum value:          %13.4f', stats[:min])
    puts sprintf('Maximum value:          %13.4f', stats[:max])
    puts sprintf('Average value:          %13.4f', stats[:avg])
    puts sprintf('Positive values:        %d', stats[:positive])
    puts sprintf('Negative values:        %d', stats[:negative])
    puts sprintf('Zero values:            %d', stats[:zero])
  end
end
