class LinuxParser < BaseParser
  COMMENT_REGEX = /^(;|#).*$/
  LINE_REGEX   = /^\w+\s*=\s*(\W*)(\w+).*$/

  def initialize(file)
    super(file)
  end

  def parse_line(line)
    return if comment?(line)
    raise ArgumentError, "invalid string format: #{line}" unless valid?(line)
    key, value = line.split('=')
    self.options[key.strip] = parse_value(value.strip)
  end

  private

  def parse_value(value)
    ValueType.new(value).to_value
  end

  def comment?(line)
    COMMENT_REGEX === line
  end

  def valid?(line)
    LINE_REGEX === line
  end
end
