require './lib/fileio'
require './lib/offset'
require './lib/key'

class Encrypt

  attr_reader :plain_text, :position, :rotate, :character_map,
              :encrypted_position, :encrypted_text, :key

  def initialize(input_file)
    @io = FileIO.new(input_file)
    @plain_text = @io.file.chars
    @character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
    combine_offset_and_key
  end

  def combine_offset_and_key
    @key, offset = Key.new, Offset.new
    a = offset.position[0] + key.position[0].to_i
    b = offset.position[1] + key.position[1].to_i
    c = offset.position[2] + key.position[2].to_i
    d = offset.position[3] + key.position[3].to_i
    @rotate = [a, b, c, d]
    find_character_index_position
  end

  def find_character_index_position
    @position = []
    plain_text.each do |string|
      position << character_map.find_index(string)
    end
    rotate_position
  end

  def rotate_position
    @encrypted_position = []
    counter = 0
    position.each do |num|
      encrypted_position << num + rotate[counter]
      counter = (counter + 1) % rotate.length
    end
    convert_position_to_encrypted_text
  end

  def convert_position_to_encrypted_text
    @encrypted_text = []
    encrypted_position.each do |num|
      encrypted_text << character_map.rotate(num)[0]
    end
    return_output_file
  end

  def return_output_file
    date = Date.today.strftime("%d%m%y")
    @io.package_encrypted_file(encrypted_text.join)
    puts "Created '#{ARGV[1]}' with the key #{key.key.join} and date #{date}"
  end
end

if __FILE__ == $PROGRAM_NAME
  Encrypt.new(ARGV[0])
end
