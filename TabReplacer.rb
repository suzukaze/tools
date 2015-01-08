require 'FileUtils'
require 'tempfile'

class TabReplacer
  def self.replace(filename)
    temp_filename = 'temp.txt'
    temp_file = Tempfile.new(temp_filename)

    File::open(filename) do |f|
      f.each do |line|
        temp_line = line.gsub(/\t/, " "*4)
        temp_file.write(temp_line)
      end
    end

    File::delete(filename)

    FileUtils.mv(temp_file.path, filename)

    temp_file.close
  end
end
