#
# 本日の日付を表示します
# さらにクリップボードに一週間をコピーします
#

require 'date'

def format_date(date)
  str_weeks = ['日', '月', '火', '水', '木', '金', '土']
  str = "#{date.strftime("%Y/%m/%d")}(#{str_weeks[date.strftime("%w").to_i]})"
end

base_date = Date.today

# 第1引数から今日の日付をたす
if ARGV.length >= 1
  base_date += ARGV[0].to_i
end

date = format_date(base_date)
puts date
IO.popen('pbcopy', 'w') {|f| f << date} # クリップボードにコピーします
