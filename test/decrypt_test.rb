require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/decrypt'

class DecryptTest < Minitest::Test

  def test_decrypt_class_it_exists
    klass = Decrypt.new("./encrypted.txt")
    assert_equal Decrypt, klass.class
  end

  def test_key_and_date_are_received_and_stored
    skip
  end

  def test_encrypted_text_converts_to_individual_characters
    skip
    input = Decrypt.new("./encrypted.txt")
    input.plain_text
    assert_equal ["w", "e", "r", "e", " ", "l", "o", "c", "k", "e", "d", " ", "r", "o", "o", "m", "s", " ", "o", "r", " ", "b", "o", "o", "k", "s", " ", "w", "r", "i", "t", "t", "e", "n", " ", "i", "n", " ", "a", " ", "v", "e", "r", "y", " ", "f", "o", "r", "e", "i", "g", "n", " ", "l", "a", "n", "g", "u", "a", "g", "e", ".", " ", "d", "o", "n", "t", " ", "s", "e", "a", "r", "c", "h", " ", "f", "o", "r", " ", "t", "h", "e", " ", "a", "n", "s", "w", "e", "r", "s", ",", " ", "w", "h", "i", "c", "h", " ", "c", "o", "u", "l", "d", " ", "n", "o", "t", " ", "b", "e", " ", "g", "i", "v", "e", "n", " ", "t", "o", " ", "y", "o", "u", " ", "n", "o", "w", ",", " ", "b", "e", "c", "a", "u", "s", "e", " ", "y", "o", "u", " ", "w", "o", "u", "l", "d", " ", "n", "o", "t", " ", "b", "e", " ", "a", "b", "l", "e", " ", "t", "o", " ", "l", "i", "v", "e", " ", "t", "h", "e", "m", ".", " ", "a", "n", "d", " ", "t", "h", "e", " ", "p", "o", "i", "n", "t", " ", "i", "s", " ", "t", "o", " ", "l", "i", "v", "e", " ", "e", "v", "e", "r", "y", "t", "h", "i", "n", "g", ".", " ", "l", "i", "v", "e", " ", "t", "h", "e", " ", "q", "u", "e", "s", "t", "i", "o", "n", "s", " ", "n", "o", "w", ".", " ", "p", "e", "r", "h", "a", "p", "s", " ", "t", "h", "e", "n", ",", " ", "s", "o", "m", "e", "d", "a", "y", " ", "f", "a", "r", " ", "i", "n", " ", "t", "h", "e", " ", "f", "u", "t", "u", "r", "e", ",", " ", "y", "o", "u", " ", "w", "i", "l", "l", " ", "g", "r", "a", "d", "u", "a", "l", "l", "y", ",", " ", "w", "i", "t", "h", "o", "u", "t", " ", "e", "v", "e", "n", " ", "n", "o", "t", "i", "c", "i", "n", "g", " ", "i", "t", ",", " ", "l", "i", "v", "e", " ", "y", "o", "u", "r", " ", "w", "a", "y", " ", "i", "n", "t", "o", " ", "t", "h", "e", " ", "a", "n", "s", "w", "e", "r", ".", " ", ".", ".", "e", "n", "d", ".", "."], input.plain_text
  end

  def test_character_map_exists
    skip
    valid_characters = Decrypt.new("./encrypted.txt")
    valid_characters.character_map
    assert_equal ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","], valid_characters.character_map
  end

  def test_decryption_rotation # ROTATION
    skip
    combination = Decrypt.new("./encrypted.txt").rotate
    assert combination
  end

  def test_find_encrypted_character_index_position
    skip
  end

  def test_reverse_rotation_on_encryped_char_position
    skip
  end

  def test_decrypted_position_converts_to_plain_text
    skip
  end

  def test_date_format_is_valid
    skip
    date = Decrypt.new("./encrypted.txt").date
    assert_equal 210915, date
  end

  def test_encrypted_text_returns_from_file_io
    skip
    text = Decrypt.new("./encrypted.txt").return_output_file
    assert_equal 'decrypted.txt', text
  end

end
