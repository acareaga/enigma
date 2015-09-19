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
    @key = ARGV[2]
    @date = ARGV[3]
    @io = FileIO.new(input_file)
    @encrypted_text = @io.file.chars
    @position = []
    @encrypted_position = []
    @decrypted_position = []
    @plain_text = []
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    create_decryption_rotation
  end

  def create_decryption_rotation
    square = (date.to_i) ** 2
    offset = square.to_s[-4..-1]
    a = offset[0].to_i + (key[0] + key[1]).to_i
    b = offset[1].to_i + (key[1] + key[2]).to_i
    c = offset[2].to_i + (key[2] + key[3]).to_i
    d = offset[3].to_i + (key[3] + key[4]).to_i
    @rotation = [a, b, c, d]
    find_character_index_position
  end

  def find_character_index_position
    @encrypted_text.each do |string|
      position << character_map.find_index(string)
    end
    # @encrypted_position = position
    reverse_rotation
  end

  # def starting_point #for backward rotation
  #   #position => index of encrypted msg
  #   counter = position % 4
  #   if counter == 0
  #     #start with the d rotation
  #   elsif counter == 1
  #     #rotation a
  #   elsif counter == 2
  #     #rotation b
  #   else counter == 3
  #     #rotation c
  #
  #   reverse_rotation
  # end

  def reverse_rotation
    counter = 0
    position.each do |num|
      @decrypted_position << num - rotation[counter]
      counter = (counter + 1) % rotation.length
    end
    convert_to_plain_text
  end

  def convert_to_plain_text
    decrypted_position.each do |num|
      plain_text << character_map.rotate(num)[0]
    end
    decrypt_output_file
  end

  def decrypt_output_file
    @plain_text = plain_text.join
    @io.package_decrypted_file(@plain_text)
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
  end

end

Decrypt.new
