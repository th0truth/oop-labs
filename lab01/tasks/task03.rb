# frozen_string_literal: true

require_relative '../task'
require_relative '../input_helper'

class Task03 < Task
  def title
    'Factorial of n and Sum of Factorials (1! .. n!)'
  end

  def execute
    puts 'Factorial Calculation and Factorial Sum'
    n = InputHelper.read_int_in_range('Enter an integer n (>= 1): ', 1, 100)

    rows = calculate_factorials_and_sums(n)
    display_table(rows)

    last_row = rows.last
    puts "\n--- Summary ---"
    puts "Factorial of #{n} (#{n}!): #{last_row[:factorial]}"
    puts "Sum of all factorials (1! .. #{n}!): #{last_row[:sum]}"
  end

  private

  def calculate_factorials_and_sums(n)
    rows = []
    current_factorial = 1
    current_sum = 0

    (1..n).each do |i|
      current_factorial *= i
      current_sum += current_factorial
      rows << {
        i: i,
        factorial: current_factorial,
        sum: current_sum
      }
    end

    rows
  end

  def display_table(rows)
    puts "\n+-----+--------------------------------+--------------------------------+"
    puts '|  i  |               i!               |       Sum (1! + ... + i!)      |'
    puts '+-----+--------------------------------+--------------------------------+'

    rows.each do |row|
      fact_str = row[:factorial].to_s
      sum_str = row[:sum].to_s

      # Truncate visually with ellipsis if huge (over 30 chars), while summary prints full
      fact_disp = fact_str.length > 30 ? "#{fact_str[0..26]}..." : fact_str
      sum_disp = sum_str.length > 30 ? "#{sum_str[0..26]}..." : sum_str

      puts sprintf('| %3d | %30s | %30s |', row[:i], fact_disp, sum_disp)
    end

    puts '+-----+--------------------------------+--------------------------------+'
  end
end
