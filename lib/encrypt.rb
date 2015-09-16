require './lib/fileio'
require './lib/offset'
require './lib/key'
require 'pry'

class Encrypt

  attr_accessor :text, :split_text

  def initialize(text)
    @text = "This is a test message."
    split_text
  end

  def split_text
    chunks = []
    until text.empty?
      chunks << text.slice!(0..3)
    end
    characters = chunks.map do |strings|
      strings.chars
    end
    combine_offset_and_key_abcd
  end

  def character_map
    character_map = ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","]
  end

  def combine_offset_and_key_abcd
    offset = Offset.new
    key = Key.new
    rotate = offset.position + key.position
    binding.pry
  end

  # def encrypt_text
  #   characters.each do |nested_array|
  #     encrypt_text << nested_array.rotate
  #   end
  # end
  #
  # def rotate
  #   nested_array.each do |character|
  #     encrypted_text << # rotate through map
  #   end
  # end

end

input_file = ARGV[0]
FileIO.new(input_file).package_output_file

if im_running_code
  input_file = ARGV[0]
  output_file = ARGV[1]
end

im_running_code = ($PROGRAM_NAME == __FILE__)
