#--
#--
# Copyright (C)2020 Pavlo Mashchak
# You can redistribute this under the terms of the MIT license
# See file LICENSE for details
#++

class ConfigParser
  attr_accessor :file, :parser

  EXTENSIONS = {
    linux: ['.cnf' , '.conf' , '.cfg' , '.cf', '.md']
  }

  def initialize(path=nil)
    unless File.exists?(path)
      raise ArgumentError, "file from path #{path} does not exist"
    end

    self.file   = File.open(path, 'r')
    self.parser = ParserDecorator.new(get_parser)
  end

  def parse
    parser.parse
  end

  private

  def get_parser
    case extension
      when *EXTENSIONS[:linux]
        LinuxParser.new(self.file)
      else
        raise ArgumentError, "extension #{extension} is not supported"
    end
  end

  def extension
    File.extname(self.file.path)
  end
end
