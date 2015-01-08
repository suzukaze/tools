require 'fileutils'
require 'date'

if ARGV.length == 0
  puts <<EOS
usage: ruby add_date_to_file.rb <filename>
       or
       ruby add_date_to_file.rb <filename> <sub_day>
EOS
  exit
end

date = Date.today

path = ARGV[0]
if ARGV.length == 2
  suby_day = ARGV[1].to_i
  date -= suby_day
end  

filename =  File.basename(path, ".zip")
dir = File.dirname(path)
new_path = "#{dir}/#{filename}_#{date.strftime("%Y%m%d")}.zip"

FileUtils.mv(path, new_path)

