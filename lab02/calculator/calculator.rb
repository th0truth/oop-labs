# frozen_string_literal: true

class Calculator
  def add(a, b)
    a + b
  end

  def subtract(a, b)
    a - b
  end

  def multiply(a, b)
    a * b
  end

  def divide(a, b)
    raise ZeroDivisionError, 'Division by zero is undefined!' if b.zero?

    a / b.to_f
  end

  def modulus(a, b)
    raise ZeroDivisionError, 'Modulo by zero is undefined!' if b.zero?

    a % b
  end

  def power(a, b)
    a**b
  end

  def square_root(a)
    raise ArgumentError, 'Cannot compute square root of negative number!' if a.negative?

    Math.sqrt(a)
  end
end
