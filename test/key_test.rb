gem 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/key'

class KeyTest < Minitest::Test

  def test_the_key_generates_a_random_five_digit_number
    key_one = Key.new
    key_two = Key.new
    refute_equal key_one, key_two
    refute_equal key_one, key_two
    refute_equal key_one, key_two
    refute_equal key_one, key_two
    refute_equal key_one, key_two
  end

  def test_it_assigns_digit_one_and_two_to_rotation_a
    key = Key.new
    assert_equal "12", key.rotation_a
  end

  def test_it_assigns_digit_two_and_three_to_rotation_b
    key = Key.new
    assert_equal "23", key.rotation_b
  end

  def test_it_assigns_digit_three_and_four_to_rotation_c
    key = Key.new
    assert_equal "34", key.rotation_c
  end

  def test_it_assigns_digit_four_and_five_to_rotation_d
    key = Key.new
    assert_equal "45", key.rotation_d
  end

end
