require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'

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

  def test_it_can_encrypt

    enigma = Enigma.new
    expected =  {
                  encryption: "keder ohulw",
                  key: "02715",
                  date: "040895"
   }

   assert_equal expected, enigma.encrypt("hello world", "02715", "040895")
  end
end
