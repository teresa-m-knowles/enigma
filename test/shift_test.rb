require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require 'mocha/minitest'
require './lib/shift'
require './lib/key'
require './lib/offset'

class ShiftTest < Minitest::Test

  def test_it_exists
    key = mock
    offset = mock

    key.stubs(:a).returns(1)
    key.stubs(:b).returns(2)
    key.stubs(:c).returns(3)
    key.stubs(:d).returns(4)

    offset.stubs(:a).returns(1)
    offset.stubs(:b).returns(2)
    offset.stubs(:c).returns(3)
    offset.stubs(:d).returns(4)

    shift = Shift.new(key, offset)

    assert_instance_of Shift, shift
  end

  def test_it_can_find_each_shift

    key = mock
    offset = mock

    key.stubs(:a).returns(1)
    key.stubs(:b).returns(2)
    key.stubs(:c).returns(3)
    key.stubs(:d).returns(4)

    offset.stubs(:a).returns(1)
    offset.stubs(:b).returns(2)
    offset.stubs(:c).returns(3)
    offset.stubs(:d).returns(4)

    shift = Shift.new(key, offset)

    shift.find_each_shift

    assert_equal 2, shift.a
    assert_equal 4, shift.b
    assert_equal 6, shift.c
    assert_equal 8, shift.d

  end
end
