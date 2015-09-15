gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encrypt'

class EncryptTest < Minitest::Test

  def test_encrypt_class_exists
    data = Encrypt.new("hello")

    assert_equal Encrypt, data.class
  end

  def test_it_can_take_in_a_file

  end

  def test_input_file_converts_text_to_string_omitting_new_lines

  end

  def test_it_rejects_files_with_invalid_characters

  end

  def test_text_splits_into_chunks_of_four_letter_long_strings

  end

  def test_each_string_is_split_into_individual_characters

  end

  def test_character_map_exists
    test = Encrypt.new("hello")

    assert test.character_map
  end

  def test_character_map_can_access_the_first_character
    test = Encrypt.new("hello")

    assert_equal "a", test.character_map[0]
  end

  def test_character_map_can_access_the_last_character
    test = Encrypt.new("hello")

    assert_equal ",", test.character_map[-1]
  end

  def test_character_map_can_access_a_character_in_the_middle
    test = Encrypt.new("hello")

    assert_equal "p", test.character_map[15]
    assert_equal 15, test.character_map.index("p")
  end

  def test_character_map_does_not_include_invalid_characters
    test = Encrypt.new("hello")

    refute test.character_map.include?("?")
  end

  def test_we_can_navigate_the_character_map_forward
    test = Encrypt.new("hello")

    assert_equal 
  end

  def test_we_can_navigate_the_character_map_backwards

  end

end
