require 'optparse'

printLineCount = false 
printWordCount = false 
printCharactersCount = false
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options][file]"
  opts.on("-l", "Print Number of lines") do
    print_lines_number = true
  end
  opts.on("-w", "Print Number of words") do
    print_lines_number = true
  end
  opts.on("-c", "Print Number of characters") do
    print_lines_number = true
  end
end.parse!

if ARGV.empty?
    abort("No file passed")
end

filepath = ARGV.last

file = File.open(filepath)
lineCount = 0
wordCount = 0
charactersCount = 0
for line in file.readlines()
    lineCount+=1
	charactersCount += line.length
	words = line.split(" ")
	wordCount += words.length
end
if printLineCount
	print lineCount, " "
end
if printWordCount  
    print wordCount, " "
end 
if printCharactersCount  
    print charactersCount, " "
end 
if !printLineCount && !printWordCount && !printCharactersCount  
    print  "#{lineCount} #{wordCount} #{charactersCount}"
end 
print "\n"
file.close()
