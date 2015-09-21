require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/fileio'

class FileIOTest < Minitest::Test

  def test_fileio_can_open_input
    input_file = '../message.txt'
    assert FileIO.new(input_file)
  end

  def test_fileio_removes_newline_characters
    input_file = '../message.txt'
    refute_equal FileIO.new(input_file), File.open(input_file).read
  end
end
