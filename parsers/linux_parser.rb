class LinuxParser < BaseParser
  COMMENT_REGEX = /^(;|#).+/
  LINE_REGEX   = /^\w+\s*=\s*\w+.*$/

  def initialize(file)
    super(file)
  end

  def parse_line(line)
    next if comment?(line)
    key, value = line.split('=')

  end

  private

  def comment?(line)
    !!COMMENT_REGEX =~ line
  end

  def valid?(line)
    !!LINE_REGEX =~ line
  end
end
