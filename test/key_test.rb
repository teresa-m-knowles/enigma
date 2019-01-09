require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/key'
require 'pry'

class KeyTest < Minitest::Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_can_set_numbers
    key = Key.new
    key.set_key("2020")

    assert_equal "2020", key.numbers
  end

  def test_it_can_randomly_generate_five_numbers
    key = Key.new

    key.generate_numbers.split('').each do |char|
      assert_equal true, (0..9).include?(char.to_i)
    end

    assert_equal 5, key.generate_numbers.length
  end

  def test_it_creates_numbers_each_time_a_new_key_is_created

    key = Key.new

    key.numbers.split('').each do |number|
      assert_equal true, (0..9).include?(number.to_i)
    end
  end

  def test_it_can_split_numbers_into_an_array
    numbers = "20301"
    key = Key.new

    expected = ["2", "0", "3", "0", "1"]

    assert_equal expected, key.split_numbers(numbers)

  end

  def test_it_can_set_each_letter
    key = Key.new("02453")

    assert_equal 2, key.set_a
    assert_equal 24, key.set_b
    assert_equal 45, key.set_c
    assert_equal 53, key.set_d
  end

  def test_it_can_set_all_numbers
    key = Key.new("02453")
    key.set_letters

    assert_equal 2, key.a
    assert_equal 24, key.b
    assert_equal 45, key.c
    assert_equal 53, key.d
  end

  def test_it_can_read_the_keys_abcd_and_they_are_all_integers
    key = Key.new

    assert_instance_of Integer, key.a
    assert_instance_of Integer, key.b
    assert_instance_of Integer, key.c
    assert_instance_of Integer, key.d
  end

  def test_it_can_be_assigned_numbers_instead_of_randomly_generating_them
    key = Key.new("02453")

    assert_equal 2, key.a
    assert_equal 24, key.b
    assert_equal 45, key.c
    assert_equal 53, key.d
  end

end
