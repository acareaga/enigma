require './lib/fileio'
require './lib/offset'
require './lib/key'

class Decrypt

  attr_reader :plain_text, :position, :rotation, :array_of_chunks,
              :decrypted_position, :encrypted_text, :counter,
              :character_map, :key, :date, :key_position

  def initialize(input_file)
    @key = ARGV[2] || 12345
    @date = ARGV[3] || 210915
    @io = FileIO.new(input_file)
    @encrypted_text = @io.file.chars
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    generate_decryption_rotation
  end

  def generate_decryption_rotation
    offset = ((date.to_i) ** 2).to_s[-4..-1]
    a = offset[0].to_i + (key[0] + key[1]).to_i
    b = offset[1].to_i + (key[1] + key[2]).to_i
    c = offset[2].to_i + (key[2] + key[3]).to_i
    d = offset[3].to_i + (key[3] + key[4]).to_i
    @rotation = [a, b, c, d]
    find_character_index_position
  end

  def find_character_index_position
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
      decrypted_position << num - rotation[counter]
      counter = (counter + 1) % rotation.length
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
    @io.package_decrypted_file(plain_text.join)
    puts "Created '#{ARGV[1]}' with the key #{ARGV[2]} and date #{ARGV[3]}"
  end
end

if __FILE__ == $PROGRAM_NAME
  Decrypt.new(ARGV[0])
end
