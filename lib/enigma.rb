require './lib/key'
require './lib/shift'
require './lib/offset'
require './lib/rotate'
require 'pry'

class Enigma

  include Rotate

  attr_reader :character_set

  def initialize
    @character_set = ("a".."z").to_a << " "
  end

  def create_key(given_key = nil)
    if given_key
      key = Key.new(given_key)
    else
      key = Key.new
    end
  end

  def create_date(given_date = nil)
    if given_date
      date = Offset.new(given_date)
    else
      date = Offset.new
    end
  end

  def split_message_in_fours(message)
    message.downcase.split('').each_slice(4).to_a
  end

  def encrypt(given_message, given_key = nil, given_date = nil)
   date = create_date(given_date)
   key = create_key(given_key)
   shift = Shift.new(key,date)
   {:encryption => rotate_forward_full_message(given_message,shift), :key=> key.numbers, :date => date.date  }
  end

 def decrypt(given_message, key, date = nil)
   key = create_key(key)
   date = create_date(date)
   shift = Shift.new(key,date)

  {:decryption => rotate_back_full_message(given_message,shift),
  :key=> key.numbers,
  :date => date.date  }
 end

 def crack(message, given_date = nil)
   all_possible_keys = ("00000".."99999").to_a

   found_key = all_possible_keys.find do |key|
    decryption = decrypt(message, key, given_date)
    decryption[:decryption][-4..-1] == " end"
   end
   decrypt(message, found_key, given_date)
 end



end
