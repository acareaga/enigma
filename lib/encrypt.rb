<<<<<<< HEAD
require_relative 'offset'
require_relative 'key'
=======
require '../lib/offset'
require '../lib/key'
>>>>>>> 3a788fc27cff3dbcd85db3f3234e51ea215db8d5
require 'pry'

class Encrypt

  attr_accessor :input_file, :output_file, :text, :split_text

  def initialize(input_file)
    @input_file = input_file
    @text = "This is a test message." # File.open(input_file).read.chomp.gsub("\n\n", " ")
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
    combine_offset_and_key_abcd
  end

  def character_map
    character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
  end

  def combine_offset_and_key_abcd
    rotation = Key.new
    position = Offset.new
    a = position.offset_position_a
    binding.pry
  end

  # def encrypt_text
  #   characters.each do |nested_array|
  #     encrypt_text << nested_array.rotate
  #   end
  # end
  #
  # def rotate
  #   nested_array.each do |character|
  #     encrypted_text << # rotate through map
  #   end
  # end

  def package_output_file
    output_file = File.open("encrypted.txt", 'w')
    # output_file.write(encrypt_text)
    date = Date.today.strftime("%d%m%y")
    puts "Created '#{output_file}' with the key .... and date #{date}"
 end

end

input_file = ARGV[0]
Encrypt.new(input_file).package_output_file
