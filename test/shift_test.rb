require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/shift'
require './lib/key'
require './lib/offset'
require 'pry'

class ShiftTest < Minitest::Test

  def test_it_exists
    key = Key.new
    offset = Offset.new
    shift = Shift.new(key, offset)
    assert_instance_of Shift, shift
  end

  def test_it_can_find_each_shift
    key = Key.new("02453")
    offset = Offset.new("101214")
    assert_equal "3796", offset.last_four
    shift = Shift.new(key, offset)

    assert_equal 5, shift.a
    assert_equal 31, shift.b
    assert_equal 54, shift.c
    assert_equal 59, shift.d
  end
end
