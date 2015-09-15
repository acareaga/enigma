require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encrypt'

class EncryptTest < Minitest::Test

  def test_encrpyt_class_exists
    data = Encrypt.new
    assert_equal "Class", data.class
  end

end
