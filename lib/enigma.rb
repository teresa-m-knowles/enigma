require './lib/key'
require './lib/shift'
require './lib/offset'
require 'pry'

class Enigma

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

  def rotate(four_characters_array, shift)
    encoded = ""
    four_characters_array.zip(shift.letters).each do |element|
      index_in_alphabet =  @character_set.index(element.first)
      if !@character_set.include?(element.first)
        encoded += element.first
      else
        encoded += @character_set.rotate(element.last)[index_in_alphabet]
      end
    end
    encoded
  end


  def rotate_back(four_characters_array, shift)
    encoded = ""
    four_characters_array.zip(shift.letters).each do |element|
      index_in_alphabet =  @character_set.index(element.first)
      if !@character_set.include?(element.first)
        encoded += element.first
      else
        encoded += @character_set.rotate(-element.last)[index_in_alphabet]
      end
    end #end of each
    encoded
  end



  def rotate_forward_full_message(given_message, shift)
    message = split_message_in_fours(given_message)
    message.map do |set_of_four|
      rotate(set_of_four,shift)
    end.join
  end

  def rotate_back_full_message(given_message, shift)
    message = split_message_in_fours(given_message)
    message.map do |set_of_four|
      rotate_back(set_of_four,shift)
    end.join
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



end
