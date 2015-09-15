require './lib/offset'
require './lib/key'
require 'pry'

class Encrypt

  attr_accessor :input_file, :output_file, :text

  def initialize(input_file)
    @input_file = input_file
    @text = File.open(input_file).read.split("\n\n")
  end

  def encrypt_text

  end

  def package_output_file
    output_file = File.open("encrypted.txt", 'w')
    # output_file.write(encrypt_text)
    puts "Created '#{output_file}' with the key #{key} and date #{date}"
 end

end

input_file = ARGV[0]
Encrypt.new(input_file).package_output_file
