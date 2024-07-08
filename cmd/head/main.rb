require 'optparse'

numberOfLines = 10
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options][file]"
  opts.on("-n LINES", Integer, "number of lines") do |n|
    numberOfLines = n
  end
end.parse!

if ARGV.empty?
    abort("No file passed")
end

filepath = ARGV.last

file = File.open(filepath)
cnt = 1
for line in file.readlines()
    if cnt == numberOfLines
        break;
    end
      puts line
      cnt += 1
end

file.close()
