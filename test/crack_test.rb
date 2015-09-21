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
    assert input.encrypted_text
  end

  def test_character_map_exists
    valid_characters = Crack.new("./encrypted.txt")
    assert_equal ('a'..'z').to_a + ('0'..'9').to_a + [" ", ".", ","], valid_characters.character_map
  end

  def test_remainder_of_end_characters_for_starting_position
    text = Crack.new("./encrypted.txt")
    assert_equal text.encrypted_text.length % 4, text.remainder[0]
  end

  def test_position_of_end_characters_is_correct
    position = Crack.new("./encrypted.txt").map_position
    assert position
  end

  def test_calculation_of_true_to_encrypted_end_position
    position = Crack.new("./encrypted.txt")
    assert_equal 15, (39 - position.character_map.index(".") + position.character_map.index("n"))
  end

  def test_difference_from_true_to_encrypted_position
    position = Crack.new("./encrypted.txt")
    assert_equal 15, position.difference[3]
  end

  def test_key_alligns_to_proper_index
    text = Crack.new("./encrypted.txt")
    assert_equal text.remainder[0], text.rotation.keys[0]
  end

  def test_reverse_rotation
    index = Crack.new("./encrypted.txt").decrypted_position
    assert index
  end

  def test_cracked_position_converts_to_plain_text
    text = Crack.new("./encrypted.txt").plain_text
    assert_equal ["d", "o", "n", "t", " ", "s", "e", "a", "r", "c", "h", " ", "f", "o", "r", " ", "t", "h", "e", " ", "a", "n", "s", "w", "e", "r", "s", ",", " ", "w", "h", "i", "c", "h", " ", "c", "o", "u", "l", "d", " ", "n", "o", "t", " ", "b", "e", " ", "g", "i", "v", "e", "n", " ", "t", "o", " ", "y", "o", "u", " ", "n", "o", "w", ",", " ", "b", "e", "c", "a", "u", "s", "e", " ", "y", "o", "u", " ", "w", "o", "u", "l", "d", " ", "n", "o", "t", " ", "b", "e", " ", "a", "b", "l", "e", " ", "t", "o", " ", "l", "i", "v", "e", " ", "t", "h", "e", "m", ".", " ", "a", "n", "d", " ", "t", "h", "e", " ", "p", "o", "i", "n", "t", " ", "i", "s", " ", "t", "o", " ", "l", "i", "v", "e", " ", "e", "v", "e", "r", "y", "t", "h", "i", "n", "g", ".", " ", "l", "i", "v", "e", " ", "t", "h", "e", " ", "q", "u", "e", "s", "t", "i", "o", "n", "s", " ", "n", "o", "w", ".", " ", "p", "e", "r", "h", "a", "p", "s", " ", "t", "h", "e", "n", ",", " ", "s", "o", "m", "e", "d", "a", "y", " ", "f", "a", "r", " ", "i", "n", " ", "t", "h", "e", " ", "f", "u", "t", "u", "r", "e", ",", " ", "y", "o", "u", " ", "w", "i", "l", "l", " ", "g", "r", "a", "d", "u", "a", "l", "l", "y", ",", " ", "w", "i", "t", "h", "o", "u", "t", " ", "e", "v", "e", "n", " ", "n", "o", "t", "i", "c", "i", "n", "g", " ", "i", "t", ",", " ", "l", "i", "v", "e", " ", "y", "o", "u", "r", " ", "w", "a", "y", " ", "i", "n", "t", "o", " ", "t", "h", "e", " ", "a", "n", "s", "w", "e", "r", ".", " ", ".", ".", "e", "n", "d", ".", "."], text
  end

  def test_cracked_text_returns_from_file_io
    skip
    cracked_file = Crack.new("./encrypted.txt").return_output_file
    assert cracked_file
  end
end
