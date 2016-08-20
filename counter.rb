require_relative './dat_parser.rb'

#parser = DatParser.new '../HELPIC.DAT'
parser = DatParser.new '../CS00/OWNFIL00.DAT'
data = parser.convert
words = data.split(' ')
word_count = {}
words.each do |w|
  count = word_count.fetch(w, 0)
  word_count[w] = count += 1
end

File.open('OWNFIL00.COUNT.TXT', 'w') do |file|
  word_count.sort_by {|_, value| value}.reverse.each do |k,v|
    file.write("#{v}: #{k}\n")
  end
end
