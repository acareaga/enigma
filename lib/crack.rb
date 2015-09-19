require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Crack

  attr_reader :plain_text, :position, :rotation, :encrypted_end_position, :encrypted_key,
              :decrypted_position, :encrypted_text, :counter, :abcd_position,
              :character_map, :key, :date, :key_position, :array_of_chunks

  def initialize
    input_file = ARGV[0]
    @date = ARGV[2]
    @io = FileIO.new(input_file)
    @encrypted_text = @io.file.chars
    @position = []
    @decrypted_position = []
    @plain_text = []
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    find_abcd_of_last_four_encrypted_text
  end

  def find_abcd_of_last_four_encrypted_text
    length = encrypted_text.length
    @abcd_position = []
    abcd_position << (length - 4) % 4
    abcd_position << (length - 3) % 4
    abcd_position << (length - 2) % 4
    abcd_position << (length - 1) % 4
    find_encrypted_end_text_and_position
  end

  def find_encrypted_end_text_and_position
    encrypted_end_text = encrypted_text[-4..-1]
    @encrypted_end_position = []
    encrypted_end_text.each do |character|
      encrypted_end_position << character_map.index(character).to_i
    end
    find_key_for_encrypted_text
  end

  def find_key_for_encrypted_text
    true_position = [13, 3, 37, 37]
    @encrypted_key = []
    encrypted_key << (39 - true_position[0]) + encrypted_end_position[0]
    encrypted_key << (39 - true_position[1]) + encrypted_end_position[1]
    encrypted_key << (39 - true_position[2]) + encrypted_end_position[2]
    encrypted_key << (39 - true_position[3]) + encrypted_end_position[3]
    combine_position_and_key_for_rotation
  end

  def combine_position_and_key_for_rotation
    rotate = Hash[abcd_position.zip(encrypted_key)]
    @key = rotate.map.with_index do |char, index|
      rotate[index]
    end
    @rotation = key
    find_character_index_position
  end

  def find_character_index_position
    @encrypted_text.each do |string|
      position << character_map.find_index(string)
    end
    reverse_rotation
  end

  def reverse_rotation
    counter = 0
    position.each do |num|
      decrypted_position << num - key[counter]
      counter = (counter + 1) % rotation.length
    end
    convert_to_plain_text
  end

  def convert_to_plain_text
    decrypted_position.each do |num|
      plain_text << character_map.rotate(num)[0]
    end
    cracked_output_file
  end

  def cracked_output_file
    @plain_text = plain_text.join
    @io.package_cracked_file(@plain_text)
    puts "Created '#{ARGV[1]}' with the cracked key #{key} and date #{ARGV[3]}"
  end

end

Crack.new
