require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Encrypt

  attr_reader :encryption_chunks, :text, :position

  def initialize
    input_file = ARGV[0] # './message.txt'
    @text = FileIO.new(input_file).file
    split_text
  end

  def split_text
    chunks = []
    until text.empty?
      chunks << text.slice!(0..3)
    end
    @encryption_chunks = chunks.map do |strings|
      strings.chars
    end
    find_character_index_position
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

  def find_character_index_position
    position = []
    character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    @encryption_chunks.map do |array|
      array.map do |string|
        position << character_map.find_index(string)
      end
    end
    binding.pry
  end

  # Add to encrypter_array.package_output_file

end

Encrypt.new
