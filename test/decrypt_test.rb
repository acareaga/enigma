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
    assert index_value
  end

  def test_reverse_rotation_on_encrypted_char_position
    decrypted_position = Decrypt.new("./encrypted.txt").decrypted_position
    assert decrypted_position
  end

  def test_decrypted_position_converts_to_plain_text
    text = Decrypt.new("./encrypted.txt").plain_text
    assert text
  end

  def test_date_is_formatted_correctly
    date = Decrypt.new("./encrypted.txt").date
    assert_equal 210915, date
  end

  def test_encrypted_text_returns_from_file_io
    skip
    output_file = Decrypt.new("./encrypted.txt").return_output_file
    assert output_file
  end

end
