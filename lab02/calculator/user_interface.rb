# frozen_string_literal: true

require_relative 'calculator'

class UserInterface
  def self.run(history = nil)
    calculator = Calculator.new

    loop do
      choice = get_choice
      break if choice.zero?

      case choice
      when 1..6
        op1 = get_operand('first')
        op2 = get_operand('second')

        begin
          case choice
          when 1
            res = calculator.add(op1, op2)
            show_result("#{op1} + #{op2} = #{res}")
            history&.add('Calculator', "#{op1} + #{op2} = #{res}")
          when 2
            res = calculator.subtract(op1, op2)
            show_result("#{op1} - #{op2} = #{res}")
            history&.add('Calculator', "#{op1} - #{op2} = #{res}")
          when 3
            res = calculator.multiply(op1, op2)
            show_result("#{op1} * #{op2} = #{res}")
            history&.add('Calculator', "#{op1} * #{op2} = #{res}")
          when 4
            res = calculator.divide(op1, op2)
            show_result("#{op1} / #{op2} = #{res}")
            history&.add('Calculator', "#{op1} / #{op2} = #{res}")
          when 5
            res = calculator.modulus(op1, op2)
            show_result("#{op1} % #{op2} = #{res}")
            history&.add('Calculator', "#{op1} % #{op2} = #{res}")
          when 6
            res = calculator.power(op1, op2)
            show_result("#{op1} ^ #{op2} = #{res}")
            history&.add('Calculator', "#{op1} ^ #{op2} = #{res}")
          end
        rescue ZeroDivisionError, ArgumentError => e
          puts "\nCalculation Error: #{e.message}"
        end

      when 7
        op = get_operand('single')
        begin
          res = calculator.square_root(op)
          show_result("sqrt(#{op}) = #{res}")
          history&.add('Calculator', "sqrt(#{op}) = #{res}")
        rescue ArgumentError => e
          puts "\nCalculation Error: #{e.message}"
        end
      end
    end
  end

  def self.get_choice
    puts "\n#{'=' * 50}"
    puts 'PROGRAM 3: CALCULATOR'.center(50)
    puts '=' * 50
    puts '1. Addition (+)'
    puts '2. Subtraction (-)'
    puts '3. Multiplication (*)'
    puts '4. Division (/)'
    puts '5. Modulus (%)'
    puts '6. Exponentiation (^)'
    puts '7. Square Root (sqrt)'
    puts '0. Return to Main Menu'
    puts '=' * 50

    loop do
      print 'Choose operation (0-7): '
      input = $stdin.gets&.strip
      exit(0) if input.nil?

      choice = input.to_i
      return choice if input.match?(/\A[0-7]\z/)

      puts 'Invalid choice! Please enter a number between 0 and 7.'
    end
  end

  def self.get_operand(name)
    loop do
      print "Enter #{name} operand: "
      input = $stdin.gets&.strip
      exit(0) if input.nil?

      cleaned = input.tr(',', '.')
      return Float(cleaned)
    rescue ArgumentError
      puts 'Error: Please enter a valid decimal number.'
    end
  end

  def self.show_result(result_text)
    puts "\n#{'-' * 40}"
    puts "Result: #{result_text}"
    puts '-' * 40
  end
end
