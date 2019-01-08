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

  def rotate_forward(given_message, shift)
    split_message_in_fours(given_message).map do |set_of_four|
      encoded = ""
      set_of_four.map.with_index do |char, i|
        index_in_alphabet = @character_set.index(char)
        if !@character_set.include?(char)
          encoded += char
        else
          if i == 0
            encoded += char = @character_set.rotate(shift.a)[index_in_alphabet]
          elsif i == 1
            encoded += char = @character_set.rotate(shift.b)[index_in_alphabet]
          elsif i == 2
            encoded += char = @character_set.rotate(shift.c)[index_in_alphabet]
          elsif i == 3
            encoded += char = @character_set.rotate(shift.d)[index_in_alphabet]
          end
        end
      end
      encoded
    end.join

  end

  def encrypt(given_message, given_key = nil, given_date = nil)
    date = create_date(given_date)
    key = create_key(given_key)
    shift = Shift.new(key,date)
    {:encryption => rotate_forward(given_message,shift), :key=> key.numbers, :date => date.date  }
  end

  def decrypt(given_message, key, date = nil)
    key = create_key(key)
    date = create_date(date)
    shift = Shift.new(key,date)
              {:decryption => rotate_back(given_message,shift),
                :key=> key.numbers,
                :date => date.date  }
  end

  def rotate_back(given_message, shift)
    split_message_in_fours(given_message).map do |set_of_four|
      encoded = ""
      set_of_four.map.with_index do |char, i|
        index_in_alphabet = @character_set.index(char)
        if !@character_set.include?(char)
          encoded += char
        else
          if i == 0
            encoded += char = @character_set.rotate(-shift.a)[index_in_alphabet]
          elsif i == 1
            encoded += char = @character_set.rotate(-shift.b)[index_in_alphabet]
          elsif i == 2
            encoded += char = @character_set.rotate(-shift.c)[index_in_alphabet]
          elsif i == 3
            encoded += char = @character_set.rotate(-shift.d)[index_in_alphabet]
          end
        end
      end
      encoded
    end.join

  end

  # def crack(encrypted_message,date = nil)
  #   date = create_date(date)
  #   array_of_chars = split_message_in_fours(encrypted_message)
  #   last_four = array_of_chars.flatten[-4..-1]
  #   actual_a_index = @character_set.index(" ")
  #   actual_b_index = @character_set.index("e")
  #   actual_c_index = @character_set.index("n")
  #   actual_d_index = @character_set.index("d")
  #
  #   index_a = @character_set.index(last_four[0])
  #   index_b = @character_set.index(last_four[1])
  #   index_c = @character_set.index(last_four[2])
  #   index_d = @character_set.index(last_four[3])
  #
  #   shift = Shift.new
  #
  #   shift.a = index_a + 1
  #   shift.b = index_b - actual_b_index
  #   shift.c = index_c - actual_c_index
  #   shift.d = index_d - actual_d_index
  #
  #   key_a = shift.a - date.a
  #   key_b = shift.b - date.b
  #   key_c = shift.c - date.c
  #   key_d = shift.d - date.d
  #   binding.pry
  #
  #
  #
  #
  #   binding.pry
    #
    # last_four.map.with_index do |char,i|
    #   index_in_alphabet = @character_set.index(char)
    #   @character_set.index(ends[0])
    #   binding.pry
    #   shift.a
    # end

  # end


end
