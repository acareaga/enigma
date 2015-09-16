require './lib/encrypt'
require 'pry'

class FileIO

  attr_reader :input_file, :output_file, :text

  def initialize(input_file)
    @input_file = input_file
    @text = File.open(input_file).read.chomp.gsub("\n\n", " ")
    # jump back to encrypt
  end

  def package_output_file
    output_file = File.open("encrypted.txt", 'w')
    output_file.write(encrypt_text)
    date = Date.today.strftime("%d%m%y")
    puts "Created '#{output_file}' with the key .... and date #{date}"
  end

end
