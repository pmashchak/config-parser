class ValueType
  BOOLEAN_POSITIVE_LIST = %w(on yes true)
  BOOLEAN_NEGATIVE_LIST = %w(off no false)
  INTEGER_REGEX = /\A[-+]?\d+\z/
  DOUBLE_REGEX = /\A[-+]?\d+\.{1}\d+\z/

  def initialize(value)
    @value = value
  end

  def to_value
    if boolean?
      positive_boolean?
    elsif integer?
      @value.to_i
    elsif double?
      @value.to_f
    else
      @value
    end
  end

  private

  def boolean?
    positive_boolean? ||
    negative_boolean?
  end

  def integer?
    INTEGER_REGEX === @value
  end

  def double?
    DOUBLE_REGEX === @value
  end

  def positive_boolean?
    BOOLEAN_POSITIVE_LIST.include?(@value)
  end

  def negative_boolean?
    BOOLEAN_NEGATIVE_LIST.include?(@value)
  end
end
