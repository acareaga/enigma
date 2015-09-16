require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/fileio'
require 'pry'

class FileIOTest < Minitest::Test

  def test_fileio_can_open_input
    input_file = '../message.txt'
    assert FileIO.new(input_file)
  end

  def test_fileio_removes_newline_characters
    input_file = '../message.txt'
    refute_equal FileIO.new(input_file), File.open(input_file).read
  end

  def test_fileio_packages_output_file
    skip
    encrypt_text = # NEED TO ADD CONVERTER STUFF
    output_file = File.open("encrypted.txt", 'w')
    output_file.write(encrypt_text)
    assert_equal encrypted_text, output_file
  end

end
