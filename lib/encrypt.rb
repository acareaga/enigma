require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Encrypt

  attr_reader :plain_text, :position, :rotate,
              :encrypted_position, :encrypted_text,
              :character_map, :key, :date

  def initialize
    input_file = ARGV[0] # '../message.txt'
    @io = FileIO.new(input_file)
    @plain_text = @io.file.chars
    @position = []
    @encrypted_position = []
    @encrypted_text = []
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    @date = Date.today.strftime("%d%m%y")
    create_offset_and_key
  end

  # def valid_characters_in_input?
  #   if character_map.include?(plain_text)
  #     create_offset_and_key
  #   else
  #     puts "An invalid character exists in the input file."
  #   end
  # end

  def create_offset_and_key
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
    @plain_text.each do |string|
      position << character_map.find_index(string)
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
    encrypted_position.each do |num|
      encrypted_text << character_map.rotate(num)[0]
    end
    encrypt_output_file
  end

  def encrypt_output_file
    @encrypted_text = encrypted_text.join
    @io.package_output_file(@encrypted_text)
    puts "Created '#{ARGV[1]}' with the key #{key.key.join} and date #{@date}"
  end

end

Encrypt.new
