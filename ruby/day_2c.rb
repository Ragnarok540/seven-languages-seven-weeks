# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.

def process_argv(option)
  case option[0]
    when "-h", "--help"
      puts "usage: ruby day_2c.rb [-h] [-v] file_name pattern"
      puts ""
      puts "positional arguments:"
      puts "  file_name pattern"
      puts ""
      puts "optional arguments:"
      puts "  -h, --help     show this help message and exit"
      puts "  -v, --version  print version number on screen and exit"
      exit
    when "-v", "--version"
      puts "rgrep version 0.0.1 - Ruby Grep"
      exit
    else
      @options[:file_name] = option[0]
      @options[:pattern] = option[1]
  end
end

@options = {}
process_argv(ARGV)
text = File.read(@options[:file_name])
text.split("\n").each_with_index do |line, idx|
    puts idx.to_s + ' ' + line if line.include? @options[:pattern]
end
