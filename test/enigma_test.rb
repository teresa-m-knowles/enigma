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

  def test_it_can_rotate_one_character

    enigma = Enigma.new

    assert_equal "c", enigma.rotate_one_character("a", 2)
    assert_equal "!", enigma.rotate_one_character("!", 5)
    assert_equal " ", enigma.rotate_one_character(" ", 27)
  end

  def test_it_can_rotate_forward_a_message_by_n_characters

    enigma = Enigma.new
    key = Key.new("1234")
    date = Offset.new("050119")
    shift = Shift.new(key, date)

    message = "abcd".split('')
    expected = "qzpi"

    assert_equal expected, enigma.rotate_forward(message, shift)
  end

  def test_it_can_rotate_back

    enigma = Enigma.new
    key = Key.new("1234")
    date = Offset.new("050119")
    shift = Shift.new(key, date)

    expected = "abcd"
    message = "qzpi"

    assert_equal expected, enigma.rotate_back(message.split(''),shift)
  end

  def test_rotate_back_also_returns_special_characters_as_themselves

    enigma = Enigma.new
    key = Key.new("1234")
    date = Offset.new("050119")
    shift = Shift.new(key, date)

    message = "qzp!".split('')
    expected = "abc!"

    assert_equal expected, enigma.rotate_back(message,shift)

  end

  def test_it_can_rotate_forward_a_full_message
    enigma = Enigma.new
    key = Key.new("02715")
    date = Offset.new("040895")
    shift = Shift.new(key, date)

    message = "hello world"

    actual = enigma.rotate_forward_full_message(message, shift)
    expected = "keder ohulw"

    assert_equal expected, actual
  end

  def test_it_can_rotate_back_a_full_message
    enigma = Enigma.new
    key = Key.new("02715")
    date = Offset.new("040895")
    shift = Shift.new(key, date)

    message = "keder ohulw"

    actual = enigma.rotate_back_full_message(message, shift)
    expected = "hello world"

    assert_equal expected, actual
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



  def test_it_uses_todays_date_if_no_date_is_given

    enigma = Enigma.new
    today = Date.today.strftime("%d%m%y")


    expected = {
                :encryption => "nfhauasdxm ",
                :key =>  "02715",
                :date => today
    }
    assert_equal expected, enigma.encrypt("hello world", "02715")
  end

  def test_it_can_decrypt_a_message_with_just_a_key_by_using_todays_date

    enigma = Enigma.new
    today = Date.today.strftime("%d%m%y")

    expected = {
                :decryption => "hello world",
                :key =>  "02715",
                :date => today
              }
    assert_equal expected,enigma.decrypt("nfhauasdxm ", "02715")
  end

  def test_it_generates_a_random_key_and_uses_todays_date_if_only_a_message_is_given_to_encrypt

    enigma = Enigma.new
    today = Date.today.strftime("%d%m%y")

    encrypted = enigma.encrypt("hello world")

    assert_equal 11, encrypted[:encryption].length
    assert_equal today, encrypted[:date]
    assert_equal 5, encrypted[:key].length
  end

  def test_it_can_crack_an_encrypted_message
    enigma = Enigma.new
    actual = enigma.crack("vjqtbeaweqihssi", "291018")

    expected = {
                decryption: "hello world end",
                date: "291018",
                key: "08304"
              }
    assert_equal expected, actual
  end

  def test_crack_uses_todays_date_if_no_date_is_given
    enigma = Enigma.new
    encrypted = enigma.encrypt("hello world end")

    cracked_hash = enigma.crack(encrypted[:encryption])

    assert_equal "hello world end", cracked_hash[:decryption]
  end

end
