require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/offset'
require 'date'
require 'pry'

class OffsetTest < Minitest::Test

  def test_it_exists
    offset = Offset.new

    assert_instance_of Offset, offset
  end

  def test_it_has_a_date_of_transmission

    offset = Offset.new
    assert offset.date
    assert_equal 6, offset.date.length
  end

  def test_it_can_set_a_date

    offset = Offset.new
    expected = Date.today.strftime("%d%m%y")

    assert_equal expected, offset.date

    offset.set_date("010119")
    assert_equal "010119", offset.date

    offset.set_date
    assert_equal expected, offset.date

  end
  def test_it_can_be_assigned_a_date
    offset = Offset.new('010109')

    assert_equal '010109', offset.date
  end

  def test_it_can_format_date_to_DDMMYY

    offset = Offset.new
    today = Date.today.strftime("%d%m%y")
    assert_equal today, offset.format_date_to_DDMMYY
  end

  def test_it_can_get_offset_from_date
    offset = Offset.new("101214")
    assert_equal "3796", offset.getting_offset_from_date
  end

  def test_it_can_assign_numbers_to_letters
    offset = Offset.new("101214")

    offset.assigning_numbers_to_letters("1234")

    assert_equal 1, offset.a
    assert_equal 2, offset.b
    assert_equal 3, offset.c
    assert_equal 4, offset.d
  end

  def test_it_can_get_offset_letters
    offset = Offset.new("101214")

    assert_equal 3, offset.a
    assert_equal 7, offset.b
    assert_equal 9, offset.c
    assert_equal 6, offset.d
  end
end
