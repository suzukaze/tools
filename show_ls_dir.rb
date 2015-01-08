#
# ディレクトリのファイル一覧をクリップボードに入れる
#
#

if ARGV.length < 1
  puts "usage: ruby dir"
  puts "dir is for (ls)"
end

dir = ARGV[0]

list = `ls #{dir}`
puts list
IO.popen('pbcopy', 'w') {|f| f << list} # クリップボードにコピーします
