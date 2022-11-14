class SimpleCalculator
  ALLOWED_OPERATIONS = ['+', '/', '*'].freeze
  UnsupportedOperation = Class.new(StandardError)

  def self.calculate(first_operand, second_operand, operation)
    if !ALLOWED_OPERATIONS.include? operation
      raise UnsupportedOperation.new("The given operation (#{operation}) is invalid. Please use a valid operation: #{ALLOWED_OPERATIONS}.")
    end

    if !first_operand.is_a?(Numeric) or !second_operand.is_a?(Numeric)
      raise ArgumentError.new("The first and second operands must both be numbers.")
    end

    result = first_operand.public_send(operation, second_operand)
    "#{first_operand} #{operation} #{second_operand} = #{result}"
  rescue ZeroDivisionError
      'Division by zero is not allowed.'
  end
end

