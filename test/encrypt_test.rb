require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encrypt'

class EncryptTest < Minitest::Test

  def test_encrypt_class_exists
    skip
    data = Encrypt.new
    assert_equal Encrypt, data.class
  end

  def test_input_file_returns_text_from_fileio
    skip
    input_file = './message.txt'
    text = FileIO.new(input_file).file
    assert text
  end

  def test_split_text_converts_to_chunks
    skip
  end

  def test_it_rejects_files_with_invalid_characters
    skip
  end

  def test_text_splits_into_chunks_of_four_letter_long_strings
    skip
  end

  def test_each_string_is_split_into_individual_characters
    skip
  end

  def test_character_map_exists
    skip
    test = Encrypt.new("hello")
    assert test.character_map
  end

  def test_character_map_can_access_the_first_character
    skip
    test = Encrypt.new("hello")
    assert_equal "a", test.character_map[0]
  end

  def test_character_map_can_access_the_last_character
    skip
    test = Encrypt.new("hello")
    assert_equal ",", test.character_map[-1]
  end

  def test_character_map_can_access_a_character_in_the_middle
    skip
    test = Encrypt.new("hello")
    assert_equal "p", test.character_map[15]
    assert_equal 15, test.character_map.index("p")
  end

  def test_character_map_does_not_include_invalid_characters
    skip
    test = Encrypt.new("hello")
    refute test.character_map.include?("?")
  end

  def test_we_can_navigate_the_character_map_forward
    skip
    test = Encrypt.new("hello")
    assert_equal
  end

  def test_we_can_navigate_the_character_map_backwards
    skip
  end

  def test_we_can_find_position_of_first_character
    text = [["I", " ", "a", "m"],["I", " ", "a", "m"]]
    character = text[0][0]
    assert_equal "I", character
  end

  def test_we_can_find_character_position_in_map
    skip
    position = map.find_index("#{character.downcase}")
  end

end
