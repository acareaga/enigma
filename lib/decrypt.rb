require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Decrypt

  attr_reader :plain_text, :position, :rotation, :encrypted_position,
              :decrypted_position, :encrypted_text, :counter,
              :character_map, :key, :date, :key_position, :array_of_chunks

  def initialize
    input_file = ARGV[0]
    @key = 34955 # ARGV[2]
    @date = 170915 # ARGV[3]
    @io = FileIO.new(input_file)
    @encrypted_text = @io.file.chars
    @position = []
    @encrypted_position = []
    @decrypted_position = []
    @plain_text = []
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    regenerate_key
  end

  def regenerate_key
    position_a = key.to_s[0] + key.to_s[1]
    position_b = key.to_s[1] + key.to_s[2]
    position_c = key.to_s[2] + key.to_s[3]
    position_d = key.to_s[3] + key.to_s[4]
    @key_position = [position_a, position_b, position_c, position_d]
    create_decryption_rotation
  end

  def create_decryption_rotation
    square = (date.to_i) ** 2
    offset = square.to_s[-4..-1]
    a = offset[0].to_i + key_position[0].to_i
    b = offset[1].to_i + key_position[1].to_i
    c = offset[2].to_i + key_position[2].to_i
    d = offset[3].to_i + key_position[3].to_i
    @rotation = [a, b, c, d]
    find_character_index_position
  end

  def find_character_index_position
    @encrypted_text.each do |string|
      position << character_map.find_index(string)
    end
    @encrypted_position = position
    last_array_size
  end

  def last_array_size
    @array_of_chunks = []
    until position.empty?
      array_of_chunks << position.slice!(0..3)
    end
    @counter = 3 - array_of_chunks[-1].size
    reverse_rotation
  end

  def reverse_rotation
    array_of_chunks.each do |num|
      @decrypted_position << num -= rotation[counter]
      counter = (counter -= 1) % rotation.length
    end
    binding.pry
    # checkout .pred method on array

    # while counter < position.length
    #   position[0] - rotation[0]

    # array.length.pred.times do |num|

    convert_position_to_decrypted_text
  end

  def convert_position_to_decrypted_text
    decrypted_position.each do |num|
      plain_text << character_map.rotate(num)[0]
    end
    decrypt_output_file
  end

  def decrypt_output_file
    @plain_text = plain_text.join
    @io.package_output_file(@plain_text)
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
  end

end

Decrypt.new
