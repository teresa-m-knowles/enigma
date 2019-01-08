module Rotate

    def rotate_one_character(char, rotate_by)
      encoded = ""
      if !@character_set.include?(char)
        encoded += char
      else
        encoded += @character_set.rotate(rotate_by)[@character_set.index(char)]
      end
      encoded
    end

    def rotate_forward(four_characters_array, shift)
      encoded = ""
      four_characters_array.zip(shift.letters).each do |element|
        encoded += rotate_one_character(element.first, element.last)
      end
      encoded
    end

    def rotate_back(four_characters_array, shift)
      encoded = ""
      four_characters_array.zip(shift.letters).each do |element|
        encoded += rotate_one_character(element.first, -element.last)
      end
      encoded
    end

    def rotate_forward_full_message(given_message, shift)
      message = split_message_in_fours(given_message)
      message.map do |set_of_four|
        rotate_forward(set_of_four,shift)
      end.join
    end

    def rotate_back_full_message(given_message, shift)
      message = split_message_in_fours(given_message)
      message.map do |set_of_four|
        rotate_back(set_of_four,shift)
      end.join
    end
end
