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

  def test_it_assigns_digit_one_and_two_to_rotation_A
    key = Key.new

    assert_equal key.generate_key[0..1], key.rotation_A
  end

  def test_it_assigns_digit_two_and_three_to_rotation_B
    key = Key.new

    assert_equal key.generate_key[1..2], key.rotation_B
  end

  def test_it_assigns_digit_three_and_four_to_rotation_C
    key = Key.new

    assert_equal key.generate_key[2..3], key.rotation_C
  end

  def test_it_assigns_digit_four_and_five_to_rotation_D
    key = Key.new

    assert_equal key.generate_key[3..4], key.rotation_D
  end

end
