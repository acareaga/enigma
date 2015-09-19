gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key'

class KeyTest < Minitest::Test
​
  def test_the_key_generates_a_random_five_digit_number
    key_one = Key.new
    key_two = Key.new
​
    100.times do
    refute_equal key_one, key_two
    end
  end
​
  def test_key_is_five_digits_long
    key = Key.new
​
    assert_equal 5, key.generate_key.length
  end
​
  def test_it_assigns_digit_one_and_two_to_rotation_a
    skip
    key = Key.new
    assert_equal "85", key.rotation_a
  end
​
  def test_it_assigns_digit_two_and_three_to_rotation_b
    skip
    key = Key.new
    assert_equal "53", key.rotation_b
  end
​
  def test_it_assigns_digit_three_and_four_to_rotation_c
    skip
    key = Key.new
    assert_equal "35", key.rotation_c
  end
​
  def test_it_assigns_digit_four_and_five_to_rotation_d
    skip
    key = Key.new
    assert_equal "59", key.rotation_d
  end
​
  def test_key_position
    skip
    key = Key.new
    assert_equal ["85", "53", "35", "59"], key.position
  end
​
end
