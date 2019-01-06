require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require 'date'

class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_contains_a_character_set_of_the_alphabet_and_a_space

    enigma = Enigma.new
    expected = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", " "]

    assert_equal expected, enigma.character_set
  end

  def test_it_can_create_a_new_key

    enigma = Enigma.new

    assert_instance_of Key, enigma.create_key
  end

  def test_it_can_create_an_offset
    enigma = Enigma.new

    today = Date.today.strftime("%d%m%y")

    assert_equal today, enigma.create_date.date

  end

  def test_it_can_encrypt_when_given_a_message_a_key_and_a_date

    enigma = Enigma.new
    expected =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
   }

   assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end

  def test_it_returns_any_character_not_in_character_set_as_itself

    enigma = Enigma.new
    expected =  {
                  encryption: "keder ohulw!",
                  key: "02715",
                  date: "040895"
   }

   assert_equal expected, enigma.encrypt("hello world!", "02715", "040895")
  end
end
