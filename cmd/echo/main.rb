require 'optparse'

omitNewline = false
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-n", "omit trailing newlines") do
    omitNewline = true
  end
end.parse!

for arg in ARGV
    print arg, " "
end
if( !omitNewline)
    print "\n"
end
