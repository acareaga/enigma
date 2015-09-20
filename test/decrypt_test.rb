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
    text = Decrypt.new("./encrypted.txt")
    text = Decrypt.new("./encrypted.txt")
    assert_equal 12345, text.key
    assert_equal 200915, text.date
  end

  def test_encrypted_text_converts_to_individual_characters
    input = Decrypt.new("./encrypted.txt")
    input.encrypted_text
    assert input.encrypted_text
  end

  def test_character_map_exists
    valid_characters = Decrypt.new("./encrypted.txt")
    valid_characters.character_map
    assert_equal ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","], valid_characters.character_map
  end

  def test_decryption_rotation
    combination = Decrypt.new("./encrypted.txt").rotation
    assert combination
  end

  def test_find_encrypted_character_index_position
    index_value = Decrypt.new("./encrypted.txt").position
    assert_equal [0, 20, 38, 23, 33, 24, 29, 4, 14, 8, 32, 1, 2, 20, 3, 1, 16, 13, 29, 1, 36, 19, 4, 26, 1, 23, 4, 3, 33, 28, 32, 12, 38, 13, 22, 6, 11, 26, 36, 7, 33, 19, 0, 23, 33, 7, 29, 1, 3, 14, 7, 8, 10, 3, 5, 18, 33, 30, 0, 24, 33, 19, 0, 26, 35, 3, 26, 8, 38, 6, 6, 22, 1, 3, 10, 18, 17, 3, 8, 18, 17, 17, 28, 1, 10, 20, 5, 1, 37, 10, 22, 4, 37, 17, 29, 1, 16, 20, 22, 15, 5, 27, 29, 1, 16, 13, 29, 16, 34, 3, 25, 17, 0, 3, 5, 11, 1, 3, 1, 18, 5, 19, 5, 1, 5, 24, 22, 23, 11, 3, 36, 12, 18, 10, 22, 8, 18, 10, 3, 28, 16, 13, 33, 17, 3, 4, 22, 15, 5, 27, 29, 1, 16, 13, 29, 1, 13, 26, 29, 22, 16, 14, 0, 17, 15, 3, 38, 18, 19, 4, 22, 19, 1, 23, 32, 4, 12, 24, 22, 23, 4, 10, 38, 3, 33, 24, 0, 16, 1, 9, 25, 28, 33, 11, 25, 21, 33, 14, 38, 1, 16, 13, 29, 1, 2, 26, 5, 24, 14, 10, 24, 1, 21, 20, 6, 1, 19, 14, 36, 15, 33, 12, 3, 4, 0, 26, 25, 15, 8, 30, 24, 1, 19, 14, 5, 11, 11, 26, 5, 1, 1, 27, 29, 17, 33, 19, 0, 23, 5, 8, 33, 17, 3, 3, 33, 23, 35, 3, 36, 12, 18, 10, 22, 28, 11, 26, 3, 1, 19, 6, 10, 1, 5, 19, 5, 18, 33, 25, 32, 8, 33, 6, 38, 22, 19, 10, 3, 2, 33, 4, 23, 8, 10, 9, 23, 2], index_value
  end

  def test_reverse_rotation_on_encrypted_char_position
    decrypted_position = Decrypt.new("./encrypted.txt").decrypted_position
    assert_equal [-8, 18, 35, 16, 25, 22, 26, -3, 6, 6, 29, -6, -6, 18, 0, -6, 8, 11, 26, -6, 28, 17, 1, 19, -7, 21, 1, -4, 25, 26, 29, 5, 30, 11, 19, -1, 3, 24, 33, 0, 25, 17, -3, 16, 25, 5, 26, -6, -5, 12, 4, 1, 2, 1, 2, 11, 25, 28, -3, 17, 25, 17, -3, 19, 27, 1, 23, 1, 30, 4, 3, 15, -7, 1, 7, 11, 9, 1, 5, 11, 9, 15, 25, -6, 2, 18, 2, -6, 29, 8, 19, -3, 29, 15, 26, -6, 8, 18, 19, 8, -3, 25, 26, -6, 8, 11, 26, 9, 26, 1, 22, 10, -8, 1, 2, 4, -7, 1, -2, 11, -3, 17, 2, -6, -3, 22, 19, 16, 3, 1, 33, 5, 10, 8, 19, 1, 10, 8, 0, 21, 8, 11, 30, 10, -5, 2, 19, 8, -3, 25, 26, -6, 8, 11, 26, -6, 5, 24, 26, 15, 8, 12, -3, 10, 7, 1, 35, 11, 11, 2, 19, 12, -7, 21, 29, -3, 4, 22, 19, 16, -4, 8, 35, -4, 25, 22, -3, 9, -7, 7, 22, 21, 25, 9, 22, 14, 25, 12, 35, -6, 8, 11, 26, -6, -6, 24, 2, 17, 6, 8, 21, -6, 13, 18, 3, -6, 11, 12, 33, 8, 25, 10, 0, -3, -8, 24, 22, 8, 0, 28, 21, -6, 11, 12, 2, 4, 3, 24, 2, -6, -7, 25, 26, 10, 25, 17, -3, 16, -3, 6, 30, 10, -5, 1, 30, 16, 27, 1, 33, 5, 10, 8, 19, 21, 3, 24, 0, -6, 11, 4, 7, -6, -3, 17, 2, 11, 25, 23, 29, 1, 25, 4, 35, 15, 11, 8, 0, -5, 25, 2, 20, 1, 2, 7, 20, -5], decrypted_position
  end

  def test_decrypted_position_converts_to_plain_text
    text = Decrypt.new("./encrypted.txt").plain_text
    assert_equal ["5", "s", "9", "q", "z", "w", "0", " ", "g", "g", "3", "7", "7", "s", "a", "7", "i", "l", "0", "7", "2", "r", "b", "t", "6", "v", "b", "9", "z", "0", "3", "f", "4", "l", "t", ",", "d", "y", "7", "a", "z", "r", " ", "q", "z", "f", "0", "7", "8", "m", "e", "b", "c", "b", "c", "l", "z", "2", " ", "r", "z", "r", " ", "t", "1", "b", "x", "b", "4", "e", "d", "p", "6", "b", "h", "l", "j", "b", "f", "l", "j", "p", "z", "7", "c", "s", "c", "7", "3", "i", "t", " ", "3", "p", "0", "7", "i", "s", "t", "i", " ", "z", "0", "7", "i", "l", "0", "j", "0", "b", "w", "k", "5", "b", "c", "e", "6", "b", ".", "l", " ", "r", "c", "7", " ", "w", "t", "q", "d", "b", "7", "f", "k", "i", "t", "b", "k", "i", "a", "v", "i", "l", "4", "k", "8", "c", "t", "i", " ", "z", "0", "7", "i", "l", "0", "7", "f", "y", "0", "p", "i", "m", " ", "k", "h", "b", "9", "l", "l", "c", "t", "m", "6", "v", "3", " ", "e", "w", "t", "q", "9", "i", "9", "9", "z", "w", " ", "j", "6", "h", "w", "v", "z", "j", "w", "o", "z", "m", "9", "7", "i", "l", "0", "7", "7", "y", "c", "r", "g", "i", "v", "7", "n", "s", "d", "7", "l", "m", "7", "i", "z", "k", "a", " ", "5", "y", "w", "i", "a", "2", "v", "7", "l", "m", "c", "e", "d", "y", "c", "7", "6", "z", "0", "k", "z", "r", " ", "q", " ", "g", "4", "k", "8", "b", "4", "q", "1", "b", "7", "f", "k", "i", "t", "v", "d", "y", "a", "7", "l", "e", "h", "7", " ", "r", "c", "l", "z", "x", "3", "b", "z", "e", "9", "p", "l", "i", "a", "8", "z", "c", "u", "b", "c", "h", "u", "8"], text
  end

  def test_date_is_formatted_correctly
    date = Decrypt.new("./encrypted.txt").date
    assert_equal 210915, date
  end

  def test_encrypted_text_returns_from_file_io
    output_file = Decrypt.new("./encrypted.txt").return_output_file
    assert output_file
  end

end
