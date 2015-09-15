require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/offset'

class OffsetTest < Minitest::Test

  def test_date_exists_and_is_formatted_correctly
    today = Offset.new
    assert_equal "140915", today.date
  end

  def test_offset_takes_last_four_digits
    today = Offset.new
    assert_equal "7225", today.offset
  end

end
