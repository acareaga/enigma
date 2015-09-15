require './lib/offset'
require './lib/key'
require 'pry'

class Encrypt

  attr_accessor :input_file, :output_file, :text, :split_text

  def initialize(input_file)
    @input_file = input_file
    @text = File.open(input_file).read.chomp.gsub("\n\n", " ")
    split_text
  end

  def split_text
    chunks = []
    until text.empty?
      chunks << text.slice!(0..3)
    end
    characters = chunks.map do |strings|
      strings.chars
    end
  end

  def generate_character_map
    character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ",", "."]
  end

  def encrypt_text

  end

  def package_output_file
    output_file = File.open("encrypted.txt", 'w')
    # output_file.write(encrypt_text)
    date = Date.today.strftime("%d%m%y")
    puts "Created '#{output_file}' with the key .... and date #{date}"
 end

end

input_file = ARGV[0]
Encrypt.new(input_file).package_output_file
