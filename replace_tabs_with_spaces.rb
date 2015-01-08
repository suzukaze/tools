require 'FileUtils'
require 'tempfile'

if ARGV.size == 0
  puts "usage:ruby [filename]"
  exit
end

filename = ARGV[0]
puts filename

temp_filename = 'temp.txt'
temp_file = Tempfile.new(temp_filename)

File::open(filename) do |f|
  f.each do |line|
    temp_line = line.gsub(/\t/, " "*4)
    temp_file.write(temp_line)
  end
end

=begin
File::open(temp_file) do |f|
  f.each do |line|
    puts line
  end
end
=end

File::delete(filename)

FileUtils.mv(temp_file.path, filename)

temp_file.close
