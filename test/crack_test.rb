require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/crack'

class CrackTest < Minitest::Test

  def test_encrypt_class_it_exists
    klass = Crack.new("./encrypted.txt")
    assert_equal Crack, klass.class
  end

  def test_encrypted_text_converts_to_individual_characters
    input = Crack.new("./encrypted.txt")
    input.encrypted_text
    assert_equal ["w", "5", "9", "b", "q", "9", "0", "v", " ", "t", "3", "s", "y", "5", "a", "s", ",", "y", "0", "s", "t", "4", "b", "e", "x", "8", "b", "u", "q", "a", "3", "3", "v", "y", "t", "x", "7", ".", "7", "y", "q", "4", " ", "b", "q", "s", "0", "s", "z", "z", "e", "z", "6", "o", "c", "9", "q", "c", " ", "c", "q", "4", " ", "e", "s", "o", "x", "z", "v", "r", "d", "a", "x", "o", "h", "9", "a", "o", "f", "9", "a", "2", "z", "s", "6", "5", "c", "s", "u", "v", "t", "v", "u", "2", "0", "s", ",", "5", "t", "6", "1", ",", "0", "s", ",", "y", "0", "7", "r", "o", "w", "8", "w", "o", "c", "2", "x", "o", ".", "9", "1", "4", "c", "s", "1", "9", "t", "b", "7", "o", "7", "3", "b", "v", "t", "z", "b", "v", "a", "g", ",", "y", "4", "8", "z", "p", "t", "6", "1", ",", "0", "s", ",", "y", "0", "s", "9", ".", "0", "a", ",", "z", " ", "8", ".", "o", "9", "9", "c", "p", "t", " ", "x", "8", "3", "v", "8", "9", "t", "b", "0", "v", "9", "u", "q", "9", " ", "7", "x", "u", "w", "g", "q", "w", "w", ",", "q", "z", "9", "s", ",", "y", "0", "s", "y", ".", "c", "c", " ", "v", "v", "s", "e", "5", "d", "s", "c", "z", "7", "6", "q", "x", "a", "v", "w", ".", "w", "6", "4", "c", "v", "s", "c", "z", "c", "2", "7", ".", "c", "s", "x", ",", "0", "8", "q", "4", " ", "b", "1", "t", "4", "8", "z", "o", "4", "b", "s", "o", "7", "3", "b", "v", "t", "g", "7", ".", "a", "s", "c", "r", "h", "s", "1", "4", "c", "9", "q", " ", "3", "z", "q", "r", "9", "a", "c", "v", "a", "t", "q", "p", "u", "z", "6", "u", "u", "t"], input.encrypted_text
  end

  def test_character_map_exists
    skip
    valid_characters = Crack.new("./encrypted.txt")
    valid_characters.character_map
    assert_equal ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","], valid_characters.character_map
  end

  def test_remainder_of_end_characters_for_starting_position
    skip
  end

  def test_position_of_end_characters_is_correct
    skip
  end

  def test_difference_from_true_to_encrypted_position
    skip
  end

  def test_key_from_date_and_rotation_of_difference_on_map
    skip
  end

  def test_encrypted_characters_map_correctly
    skip
  end

  def test_rotation_reverse_based_on_cracked_key_and_offset
    skip
  end

  def test_cracked_position_convert_to_plain_text
    skip
  end

  def test_date_format_is_valid
    skip
    date = Crack.new("./encrypted.txt").date
    assert_equal 210915, date
  end

  def test_cracked_text_returns_from_file_io
    skip
    text = Crack.new("./encrypted.txt").return_output_file
    assert_equal 'cracked.txt', text
  end

end
