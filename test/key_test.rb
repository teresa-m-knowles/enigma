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

  def test_it_can_randomly_generate_five_numbers

    key = Key.new

    key.generate_numbers.split('').each do |char|
      new = char.to_i
      assert_equal true, (0..9).include?(new)
    end

    assert_equal 5, key.generate_numbers.length

  end

  def test_it_creates_numbers_each_time_a_new_key_is_created

    key = Key.new

    key.numbers.split('').each do |number|
      assert_equal true, (0..9).include?(number.to_i)
    end

  end

  def test_it_can_assign_numbers_to_letters_two_by_two
    key = Key.new

    assert_instance_of Integer, key.a
    assert_equal 2, key.a.count
  end

end
