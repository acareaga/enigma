require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/fileio'

class FileIOTest < Minitest::Test

  def test_fileio_exists
    input_file = '../message.txt'
    assert FileIO.new(input_file)
  end

  def test_fileio_opens_input
    input_file = '../message.txt'
    text = File.open(input_file).read
    assert_equal text, input_file
  end

end
