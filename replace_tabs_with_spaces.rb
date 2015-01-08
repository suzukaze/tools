require './TabReplacer'

if ARGV.size == 0
  puts "usage:ruby [filename]"
  exit
end

filename = ARGV[0]
puts filename

TabReplacer.replace(filename)
