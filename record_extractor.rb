require 'hex_string'
require_relative './dat_parser.rb'

encoding_options = {
  :invalid           => :replace,  # Replace invalid byte sequences
  :undef             => :replace,  # Replace anything not defined in ASCII
  :replace           => ' ',       # Use a blank for those replacements
  :universal_newline => true       # Always break lines with \n
}

to_clear = [
  '00', '01', '02', '03', '04', '05', '06', '07', '08', '09', '0a', '0b', '0c', '0d', '0e', '0f',
  '10', '11', '12', '13', '14'
]

#parser = DatParser.new '../HELPIC.DAT'
parser = DatParser.new '../CS00/OWNFIL00.DAT'
data = parser.read
letters = data.split(' ')
letters.each_with_index do |l, i|
  if l == 'e1'
    letters[i] = letters[i+1]
  end
end

to_clear_regex = /(#{to_clear.join('|')})/

uncompressed_letters = letters.join(' ')
  .gsub(to_clear_regex, '')
  .to_byte_string

File.open('OWNFIL00.RECORDS.TXT', 'w') do |file|
  #records.each do |v|
    file.write("#{uncompressed_letters.encode('ASCII-8BIT', encoding_options)} \n\n\n\n")
  #end
end
