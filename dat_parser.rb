require 'hex_string'

class DatParser
  def initialize(filepath)
    @filepath = filepath
  end

  def convert
    read
    @file_data
      .to_byte_string
  end

  def read
    @file_data ||= File.read(@filepath).to_hex_string
  end
end
