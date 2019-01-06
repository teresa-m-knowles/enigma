require 'date'
require 'pry'

class Offset

  attr_accessor :date,
                :last_four,
                :a,
                :b,
                :c,
                :d


  def initialize(date = nil)
    if date
      @date = date.to_s
    else
      @date = Date.today
      format_date_to_DDMMYY
    end
    getting_offset_from_date
  end

  def format_date_to_DDMMYY
    @date = @date.strftime("%d%m%y")
  end

  def getting_offset_from_date
    initial_number = @date.to_i
    squared = initial_number * initial_number
    @last_four = squared.to_s[-4..-1]
  end

  def assigning_numbers_to_letters
    four = @last_four.to_s
    @a = four[0].to_i
    @b = four[1].to_i
    @c = four[2].to_i
    @d = four[3].to_i
    binding.pry

  end


end
