# frozen_string_literal: true

require_relative '../task'
require_relative '../input_helper'

class Task04 < Task
  def title
    'Find Perfect Numbers in a Range'
  end

  def execute
    puts 'Search for Perfect Numbers'
    puts 'A perfect number is a positive integer equal to the sum of its proper divisors.'

    start_num = InputHelper.read_int('Enter range start: ')
    end_num = InputHelper.read_int('Enter range end: ')

    if start_num > end_num
      puts "Notice: start (#{start_num}) > end (#{end_num}). Swapping values."
      start_num, end_num = end_num, start_num
    end

    perfect_numbers = find_perfect_numbers(start_num, end_num)
    display_results(start_num, end_num, perfect_numbers)
  end

  private

  # Efficient O(sqrt(n)) proper divisors search
  def proper_divisors(num)
    return [] if num <= 1

    divisors = [1]
    limit = Integer.sqrt(num)

    (2..limit).each do |d|
      if (num % d).zero?
        divisors << d
        paired = num / d
        divisors << paired if paired != d
      end
    end

    divisors.sort
  end

  def perfect?(num)
    return false if num <= 1

    divisors = proper_divisors(num)
    divisors.sum == num
  end

  def find_perfect_numbers(start_num, end_num)
    results = []

    # Perfect numbers can only be positive integers >= 2
    actual_start = [start_num, 2].max

    (actual_start..end_num).each do |n|
      next unless perfect?(n)

      divs = proper_divisors(n)
      results << {
        number: n,
        divisors: divs
      }
    end

    results
  end

  def display_results(start_num, end_num, results)
    puts "\n" + ('=' * 45)
    puts "Perfect numbers search in range [#{start_num} .. #{end_num}]:"
    puts '=' * 45

    if results.empty?
      puts 'No perfect numbers found in the specified range.'
    else
      results.each do |item|
        num = item[:number]
        divs = item[:divisors]
        formula = "#{divs.join(' + ')} = #{num}"

        puts "Found perfect number: #{num}"
        puts "Proper divisors:      #{divs.join(', ')}"
        puts "Decomposition:        #{formula}"
        puts '-' * 45
      end
      puts "Total perfect numbers found: #{results.size}"
    end
  end
end
