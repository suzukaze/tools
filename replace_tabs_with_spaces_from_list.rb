require './TabReplacer'

if ARGV.size == 0
  puts "usage:ruby [list filename]"
  exit
end

list_filename = ARGV[0]
puts list_filename

File::open(list_filename) do |f|
  f.each do |line|
    puts line
    TabReplacer.replace(line)
  end
end
