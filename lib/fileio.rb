require 'pry'

class FileIO

  attr_reader :file, :output_file, :encrypted_text

  def initialize(input_file)
    @file = File.open(input_file).read.chomp.gsub("\n\n", " ").downcase
  end

  def package_output_file(text)
    output_file = File.open("encrypted.txt", 'w')
    output_file.write(text)
    date = Date.today.strftime("%d%m%y")
    puts "Created '#{ARGV[1]}' with the key #{key.key.join} and date #{date}"
  end

end
