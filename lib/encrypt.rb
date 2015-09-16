require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Encrypt

  attr_reader :characters, :text

  def initialize
    input_file = ARGV[0]
    @text = FileIO.new(input_file).file
    split_text
  end

  def split_text
    chunks = []
    until text.empty?
      chunks << text.slice!(0..3)
    end
    @characters = chunks.map do |strings|
      strings.chars
    end
    encrypt_text
  end

  def combine_offset_and_key_abcd
    offset = Offset.new
    key = Key.new
    a = offset.position[0] + key.position[0].to_i
    b = offset.position[1] + key.position[1].to_i
    c = offset.position[2] + key.position[2].to_i
    d = offset.position[3] + key.position[3].to_i
    rotate = [a, b, c, d]
  end

  def encrypt_text
    character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    binding.pry
    characters.each do |nested_array|
      encrypt_text << nested_array.rotate % character_map
    end
  end
end

Encrypt.new

# input_file = ARGV[0]
# FileIO.new(input_file) #.package_output_file

# if im_running_code
#   input_file = ARGV[0]
#   output_file = ARGV[1]
# end
#
# im_running_code = ($PROGRAM_NAME == __FILE__)
