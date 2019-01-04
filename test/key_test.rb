require 'minitest/autorun'
require 'minitest/pride'
require './test/test_helper'
require './lib/key'

class KeyTest < Minitest :: Test

  def test_it_exists
    key = Key.new

    assert_instance_of Key, key
  end

  def test_it_can_randomly_generate_five_numbers

    key = Key.new

    key.abcd.all? do |letter|
      assert_instance_of Integer, letter
    end

    assert_equal 5, key.abcd.count

  end

end
