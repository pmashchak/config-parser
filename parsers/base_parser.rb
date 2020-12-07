class BaseParser
  attr_accessor :options

  def initialize(file)
    self.options = {}
    file.map { |line| parse_line(line.strip) }
  end

  private

    def method_missing(name, *args, &block)
      method_name = name.to_s
      if self.options.has_key?(method_name)
        self.options[method_name]
      else
        raise NoMethodError, "config  #{method_name} not found"
      end
    end

    def parse_line
      raise 'not implemented'
    end
end
