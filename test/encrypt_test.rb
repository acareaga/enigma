require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encrypt'

class EncryptTest < Minitest::Test

  def test_it_exists
    klass = Encrypt.new
    assert_equal Encrypt, klass.class
  end

  def test_plain_text_returns_from_fileio
    text = Encrypt.new
    text.plain_text
    assert_equal ["i", " ", "a", "m", " ", "h", "a", "p", "p", "y", " ", "t", "o", " ", "j", "o", "i", "n", " ", "w", "i", "t", "h", " ", "y", "o", "u", " ", "t", "o", "d", "a", "y", ".", " ", ".", ".", "e", "n", "d", ".", "."], text.plain_text
  end

  def test_character_map_exists
    text = Encrypt.new
    text.character_map
    assert text.character_map
  end

  def test_character_map_includes_all_39_characters
    text = Encrypt.new
    text.character_map
    assert_equal 39, text.character_map.length
  end

  def test_date_is_formatted_correct

  end

end
