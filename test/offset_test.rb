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
  def test_it_can_be_assigned_a_date
    offset = Offset.new('010109')

    assert_equal '010109', offset.date
  end

  def test_it_can_format_date_to_DDMMYY

    offset = Offset.new
    today = Date.today.strftime("%d%m%y")
    assert_equal offset.date, today
  end
end
