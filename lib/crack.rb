require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Crack

  attr_reader :plain_text, :position, :map_position, :difference,
              :decrypted_position, :encrypted_text, :counter, :date,
              :character_map, :key, :key_position, :remainder, :rotation

  def initialize(input_file)
    @date = ARGV[2]
    @io = FileIO.new(input_file)
    @encrypted_text = @io.file.chars
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    find_remainder_of_end_characters
  end

  def find_remainder_of_end_characters
    @remainder = []
    remainder << (encrypted_text.length - 4) % 4
    remainder << (encrypted_text.length - 3) % 4
    remainder << (encrypted_text.length - 2) % 4
    remainder << (encrypted_text.length - 1) % 4
    find_map_position_of_end_characters
  end

  def find_map_position_of_end_characters
    @map_position = []
    encrypted_end_text = encrypted_text[-4..-1]
    encrypted_end_text.each do |character|
      map_position << character_map.index(character).to_i
    end
    find_difference_in_position_on_map
  end

  def find_difference_in_position_on_map
    @difference = []
    true_position = [13, 3, 37, 37]
    difference << (39 - true_position[0]) + map_position[0]
    difference << (39 - true_position[1]) + map_position[1]
    difference << (39 - true_position[2]) + map_position[2]
    difference << (39 - true_position[3]) + map_position[3]
    allign_rotation_index
  end

  def allign_rotation_index
    @rotation = Hash[remainder.zip(difference)]
    @key = rotation.map.with_index do |char, index|
      rotation[index]
    end
    find_map_position_of_all_characters
  end

  def find_map_position_of_all_characters
    @position = []
    encrypted_text.each do |string|
      position << character_map.find_index(string)
    end
    reverse_rotation
  end

  def reverse_rotation
    @decrypted_position = []
    counter = 0
    position.each do |num|
      decrypted_position << num - key[counter]
      counter = (counter + 1) % key.length
    end
    convert_to_plain_text
  end

  def convert_to_plain_text
    @plain_text = []
    decrypted_position.each do |num|
      plain_text << character_map.rotate(num)[0]
    end
    return_output_file
  end

  def return_output_file
    @io.package_cracked_file(plain_text.join)
    puts "Created '#{ARGV[1]}' with the cracked key #{key.join} and date #{date}"
  end
end

if __FILE__ == $PROGRAM_NAME
  Crack.new(ARGV[0])
end
