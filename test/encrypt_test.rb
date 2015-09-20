require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/encrypt'

class EncryptTest < Minitest::Test

  def test_encrypt_class_it_exists
    klass = Encrypt.new("./message.txt")
    assert_equal Encrypt, klass.class
  end

  def test_input_file_turns_string_into_individual_characters
    input = Encrypt.new("./message.txt")
    input.plain_text
    assert_equal ["d", "o", "n", "t", " ", "s", "e", "a", "r", "c", "h", " ", "f", "o", "r", " ", "t", "h", "e", " ", "a", "n", "s", "w", "e", "r", "s", ",", " ", "w", "h", "i", "c", "h", " ", "c", "o", "u", "l", "d", " ", "n", "o", "t", " ", "b", "e", " ", "g", "i", "v", "e", "n", " ", "t", "o", " ", "y", "o", "u", " ", "n", "o", "w", ",", " ", "b", "e", "c", "a", "u", "s", "e", " ", "y", "o", "u", " ", "w", "o", "u", "l", "d", " ", "n", "o", "t", " ", "b", "e", " ", "a", "b", "l", "e", " ", "t", "o", " ", "l", "i", "v", "e", " ", "t", "h", "e", "m", ".", " ", "a", "n", "d", " ", "t", "h", "e", " ", "p", "o", "i", "n", "t", " ", "i", "s", " ", "t", "o", " ", "l", "i", "v", "e", " ", "e", "v", "e", "r", "y", "t", "h", "i", "n", "g", ".", " ", "l", "i", "v", "e", " ", "t", "h", "e", " ", "q", "u", "e", "s", "t", "i", "o", "n", "s", " ", "n", "o", "w", ".", " ", "p", "e", "r", "h", "a", "p", "s", " ", "t", "h", "e", "n", ",", " ", "s", "o", "m", "e", "d", "a", "y", " ", "f", "a", "r", " ", "i", "n", " ", "t", "h", "e", " ", "f", "u", "t", "u", "r", "e", ",", " ", "y", "o", "u", " ", "w", "i", "l", "l", " ", "g", "r", "a", "d", "u", "a", "l", "l", "y", ",", " ", "w", "i", "t", "h", "o", "u", "t", " ", "e", "v", "e", "n", " ", "n", "o", "t", "i", "c", "i", "n", "g", " ", "i", "t", ",", " ", "l", "i", "v", "e", " ", "y", "o", "u", "r", " ", "w", "a", "y", " ", "i", "n", "t", "o", " ", "t", "h", "e", " ", "a", "n", "s", "w", "e", "r", ".", " ", ".", ".", "e", "n", "d", ".", "."], input.plain_text
  end

  def test_character_map_exists
    valid_characters = Encrypt.new("./message.txt")
    valid_characters.character_map
    assert_equal ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","], valid_characters.character_map
  end

  def test_character_map_includes_39_characters
    valid_characters = Encrypt.new("./message.txt").character_map
    assert_equal 39, valid_characters.length
  end

  def test_character_and_index_position_on_map_are_correct
    valid_characters = Encrypt.new("./message.txt").character_map
    assert_equal "t", valid_characters[-20]
    assert_equal "i", valid_characters[8]
  end

  def test_character_map_does_not_include_invalid_characters
    valid_characters = Encrypt.new("./message.txt").character_map
    assert_equal false, valid_characters.include?("?")
    assert_equal false, valid_characters.include?("&")
  end

  def test_random_key_generates_for_combination
    key = Encrypt.new("./message.txt").key
    refute_equal [1, 2, 3, 4, 5], key
  end

  def test_offset_and_key_combination
    combination = Encrypt.new("./message.txt").rotate
    assert combination
  end

  def test_first_input_character_position_on_map
    input = Encrypt.new("./message.txt").position
    assert_equal 3, input[0]
  end

  def test_end_input_character_position_on_map
    input = Encrypt.new("./message.txt").position
    assert_equal 37, input[-1]
  end

  def test_position_rotates_based_on_key_offset_combo
    position = Encrypt.new("./message.txt").encrypted_position
    assert position
  end

  def test_rotated_position_converts_to_encrypted_text
    text = Encrypt.new("./message.txt").encrypted_text
    assert text
  end

  def test_encrypted_text_returns_from_file_io
    skip
    text = Encrypt.new("./message.txt").return_output_file
    assert_equal 'encrypted.txt', text
  end

end
