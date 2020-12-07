class BaseParser
  attr_accessor :keys

  def initialize(file)
    self.keys = {}
    self.file_lines = file.map { |line| line.strip }
  end

  def parse_line
    raise 'not implemented'
  end

  def parse
    self.file_lines.each { |line| parse_line(line) }
    self
  end

  protected

    attr_accessor :file_lines
end
