require 'optparse'

print_lines_number = false
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options][file]"

  opts.on("-n", "number of lines") do
    print_lines_number = true
  end
end.parse!

if ARGV.empty?
    abort("No file passed")
end

filepath = ARGV.last

file = File.open(filepath)
cnt = 1
for line in file.readlines()
    if print_lines_number
        print "#{cnt} "
      end
      puts line
      cnt += 1
end

file.close()
