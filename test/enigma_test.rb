require './test/test_helper'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/enigma'
require './lib/shift'
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
                  encryption: "k!der ohulw@",
                  key: "02715",
                  date: "040895"
   }

   assert_equal expected, enigma.encrypt("h!llo world@", "02715", "040895")
  end

  def test_it_can_split_a_message_every_four_characters
    enigma = Enigma.new
    message = "Aegon is a Blackfyre"

    expected =  [["a", "e", "g", "o"],
                  ["n", " ", "i", "s"],
                  [" ", "a", " ", "b"],
                  ["l", "a", "c", "k"],
                  ["f", "y", "r", "e"]]

  assert_equal expected, enigma.split_message_in_fours(message)

  end

  def test_it_can_rotate_forward_a_message_by_n_characters
    enigma = Enigma.new
    key = Key.new("1234")
    date = Offset.new("050119")
    shift = Shift.new(key, date)

    message = "abcd"
    expected = "qzpi"

    assert_equal expected, enigma.rotate_forward(message, shift)
  end

  def test_it_can_decrypt_a_message
    enigma = Enigma.new

    expected =   {
                    decryption: "hello world",
                    key: "02715",
                    date: "040895"
                  }

    assert_equal expected,  enigma.decrypt("keder ohulw", "02715", "040895")

  end

  def test_it_can_rotate_backward
    enigma = Enigma.new
    key = Key.new("1234")
    date = Offset.new("050119")
    shift = Shift.new(key, date)

    expected = "abcd"
    message = "qzpi"

    assert_equal expected, enigma.rotate_back(message,shift)
  end
end
