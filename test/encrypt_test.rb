require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/encrypt'

class EncryptTest < Minitest::Test

  def test_date_exists_and_is_formatted_correctly
    today = Encrypt.new
    assert
  end

end
