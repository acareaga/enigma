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

    assert_equal ["t", "j", "6", "b", "7", "q", "3", ",", "h", "j", "s", "7", "o", "t", "3", "j", "p", "c", "3", "o", "7", "g", "3", "l", "h", "x", "m", "t", "o", "n", "8", "q", "b", "s", "m", "f", "k", "c", "p", "7", "s", "j", "6", "v", "7", "k", "3", "o", "b", "n", "v", "k", "7", "q", "p", "k", "d", "z", "p", "d", "b", "d", "m", "a", "l", "s", "8", "7", "p", "j", "p", "o", ",", "m", "m", "c", "l", "w", "m", "q", "e", "j", "m", " ", "k", "x", ".", "b", "o", "x", "o", "7", "t", "m", "x", ",", "e", "c", "r", "l", "r", "q", "s", "7", "k", "t", "8", "7", ".", "j", "m", "d", "f", "0", "t", "k", "7", "y", "3", "7", "v", "t", "9", "7", "k", "t", ".", "9", "7", "g", "t", ",", " ", "z", "7", "b", "7", "3", "3", "r", "7", "1", "3", "r", "i", "i", "m", "k", "l", "y", "m", ".", "b", "c", "p", ".", "i", "j", "m", "q", "l", "c", "0", "f", "s", "j", "m", "q", "e", "j", "1", "8", "7", "f", "2", "a", "7", "y", "w", "b", "7", "u", "3", "f", "k", "y", "m", "f", "p", "c", "8", "l", "7", "q", "x", "s", "b", "c", "t", "s", "b", "w", "a", "q", "e", "n", "2", "d", "8", "c", "0", "f", "s", "j", "m", "q", "e", "j", "m", "n", "r", "j", "7", "q", "f", "t", "2", "p", "7", "s", "3", "t", "8", "c", "4", "b", "o", "m", "p", "m", "p", "c", "8", "e", "b", "s", "o", "7", "p", "t", "1", "b", "a", "f", "a", "7", "c", "f", "6", "7", "f", "s", "m", "q", "e", "j", "m", "c", "r", "y", "9", "o", "b", "e", "m", "v", "l", "z", "m", "t", "f", "q", "0", "7", "d", "w", "p", "a", "r", "f", "0", "i", "v", "e", "m", "t", "f", "y", "w", "l", "r", "y", "m", "b", "s", "j", "2", "7", "k", "t", "8", "f", ",", "n", "2", "d", "7", "n", "8", "9", "7", "q", "x", "s", "b", "c", "a", "l", "r", "w", "m", "t", " ", "3", "m", "f", "k", "y", "3", "7", "q", "m", "t", "7", " ", "s", "7", "t", "b", "w", "n", "7", "8", "d", "t", "k", "a", "d", "n"], input.encrypted_text
  end

  def test_character_map_exists
    valid_characters = Crack.new("./encrypted.txt")

    assert_equal ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","], valid_characters.character_map
  end

  def test_remainder_of_end_characters_for_starting_position
    test = Crack.new("./encrypted.txt")

    assert_equal test.encrypted_text.length % 4, test.remainder[0]
  end

  def test_position_of_end_characters_is_correct
    test = Crack.new("./encrypted.txt")

    assert_equal test.encrypted_text[-4..-1], ["k", "a", "d", "n"]
    assert_equal test.map_position, [10, 0, 3, 13]
  end

  def test_difference_from_true_to_encrypted_position
    test = Crack.new("./encrypted.txt")

    assert_equal test.difference[3], 15
    assert_equal (39 - test.character_map.index(".") + test.character_map.index("n")), 15
  end

  def test_key_alligns_to_proper_index
    test = Crack.new("./encrypted.txt")

    assert_equal test.remainder[0], test.rotation.keys[0]
  end

  def test_reverse_rotation
    skip
  end

  def test_cracked_position_convert_to_plain_text
    skip
  end

  def test_date_format_is_valid
    skip
    date = Crack.new("./encrypted.txt").date

    assert_equal 200915, date
  end

  def test_key_is_returned_to_valid_format
    skip
  end

  def test_cracked_text_returns_from_file_io
    skip
    text = Crack.new("./encrypted.txt").return_output_file

    assert_equal 'cracked.txt', text
  end

end
