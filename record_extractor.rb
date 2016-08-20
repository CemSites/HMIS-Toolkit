require 'hex_string'
require_relative './dat_parser.rb'

encoding_options = {
  :invalid           => :replace,  # Replace invalid byte sequences
  :undef             => :replace,  # Replace anything not defined in ASCII
  :replace           => '',        # Use a blank for those replacements
  :universal_newline => true       # Always break lines with \n
}

#parser = DatParser.new '../HELPIC.DAT'
parser = DatParser.new '../CS00/OWNFIL00.DAT'
data = parser.read
letters = data.split(' ')
letters.each_with_index do |l, i|
  if l == 'e1'
    letters[i] = letters[i+1]
  end
end

uncompressed_letters = letters.join(' ').to_byte_string

records = uncompressed_letters.split('RECORD')
organzied_records = []

File.open('OWNFIL00.RECORDS.TXT', 'w') do |file|
  records.each do |v|
    file.write("#{v} \n\n")
  end
end
