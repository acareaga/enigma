require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require 'offset'

class OffsetTest < Minitest::Test

  def test_date_exists_and_is_formatted_correctly
    today = Offset.new
    assert_equal "150915", today.date
  end

  def test_offset_takes_last_four_digits
    today = Offset.new
    assert_equal "7225", today.offset
  end

  def test_offset_position_a
    position = Offset.new
    assert_equal 7, position.position_a
  end

  def test_offset_position_b
    position = Offset.new
    assert_equal 2, position.position_b
  end

  def test_offset_position_c
    position = Offset.new
    assert_equal 2, position.position_c
  end

  def test_offset_position_d
    position = Offset.new
    assert_equal 5, position.position_d
  end

  def test_offset_position
    offset = Offset.new
    assert_equal [7, 2, 2, 5], offset.position
  end

end
