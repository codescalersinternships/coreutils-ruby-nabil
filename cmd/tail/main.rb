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
arr = []
for line in file.readlines()
    arr.push(line)
end

for i in ([arr.length - (numberOfLines), 0].max... arr.length)
    puts arr[i];
end
file.close()
