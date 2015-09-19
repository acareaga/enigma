require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encrypt'

class EncryptTest < Minitest::Test

  def test_encrypt_class_it_exists
    klass = Encrypt.new

    assert_equal Encrypt, klass.class
  end

  def test_it_rejects_files_with_invalid_characters
    skip
    test = Encrypt.new

  end

  def test_input_file_turns_string_into_individual_characters
    skip
    test = Encrypt.new
    test.plain_text

    assert_equal ["i", " ", "a", "m", " ", "h", "a", "p", "p", "y", " ", "t", "o", " ", "j", "o", "i", "n", " ", "w", "i", "t", "h", " ", "y", "o", "u", " ", "t", "o", "d", "a", "y", ".", " ", ".", ".", "e", "n", "d", ".", "."], test.plain_text
  end

  def test_character_map_exists
    test = Encrypt.new

    assert test.character_map
  end

  def test_character_map_can_access_the_first_character
    test = Encrypt.new

    assert_equal "a", test.character_map[0]
  end


  def test_character_map_can_access_the_last_character
    test = Encrypt.new

    assert_equal ",", test.character_map[-1]
  end

  def test_character_map_can_access_a_character_in_the_middle
    test = Encrypt.new

    assert_equal "p", test.character_map[15]
    assert_equal 15, test.character_map.index("p")
  end

  def test_character_map_includes_39_characters
    test = Encrypt.new

    assert_equal 39, test.character_map.length
  end

  def test_we_can_navigate_the_character_map_forward
    test = Encrypt.new

    assert_equal "f", test.character_map.rotate(5)[0]
    assert_equal " ", test.character_map.rotate(36)[0]
  end

  def test_we_can_navigate_the_character_map_backwards
    test = Encrypt.new

    assert_equal ",", test.character_map.rotate(-1)[0]
    assert_equal "x", test.character_map.rotate(-16)[0]
  end

  def test_we_can_find_character_index_in_map
   test = Encrypt.new

   assert_equal 16, test.character_map.find_index("q")
  end

  def test_rotation_is_an_array_of_key_and_offset_combined
    skip
  end

  def test_it_encrypts_to_the_proper_character
    skip
    test = Encrypt.new

  end

end
