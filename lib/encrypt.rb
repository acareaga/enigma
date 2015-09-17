require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Encrypt

  attr_reader :encryption_chunks, :text, :position, :rotate,
              :encrypted_position, :encrypted_text,
              :character_map, :key

  def initialize
    input_file = ARGV[0] # './message.txt'
    @text = FileIO.new(input_file).file
    @position = []
    @encrypted_position = []
    @encrypted_text = []
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
    add_offset_and_key
  end

  def add_offset_and_key
    offset = Offset.new
    @key = Key.new
    a = offset.position[0] + key.position[0].to_i
    b = offset.position[1] + key.position[1].to_i
    c = offset.position[2] + key.position[2].to_i
    d = offset.position[3] + key.position[3].to_i
    @rotate = [a, b, c, d]
    find_character_index_position
  end

  def find_character_index_position
    character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    encryption_chunks.each do |array|
      array.each do |string|
        position << character_map.find_index(string)
      end
    end
    add_rotation_to_position
  end

  def add_rotation_to_position
    counter = 0
    position.each do |num|
      encrypted_position << num + rotate[counter]
      counter = (counter + 1) % rotate.length
    end
    convert_position_to_encrypted_text
  end

  def convert_position_to_encrypted_text
    character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    encrypted_position.each do |num|
      encrypted_text << character_map.rotate(num)[0]
    end
    package_output_file(encrypted_text)
  end

end

Encrypt.new
