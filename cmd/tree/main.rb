require 'optparse'



def tree(currLevel, maxLevel, dirPath)
    return if  currLevel >  maxLevel
  
    content = Dir.entries(dirPath) - %w[. ..]
    for entry in content
        for i in 1...(currLevel)
            print " "
        end
        entryPath = File.join(dirPath, entry)
        print "|--#{entry}\n"
        if File.directory?(entryPath)
          tree(currLevel + 1, maxLevel, entryPath)
        end
    end
    
end



depthLvl = 2
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options][file]"
  opts.on("-l LINES", Integer, "depth") do |l|
    depthLvl = l
  end
end.parse!

if ARGV.empty?
    abort("No directory passed")
end

dirPath = ARGV.last

tree(1, depthLvl, dirPath)