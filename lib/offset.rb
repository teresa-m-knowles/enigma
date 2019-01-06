require 'date'
require 'pry'

class Offset

  attr_accessor :date

  def initialize(date = nil)
    if date
      @date = date.to_s
      divide_string
    else
      @date = Date.today.to_s
      format_date_to_DDMMYY
    end
    binding.pry
    format_date_to_DDMMYY
  end

  def format_date_to_DDMMYY
    divided = @date.split('-')
    day = divided[2]
    month = divided[1]
    year = divided[0][2..-1]
    @date = day + month + year
  end

  def divide_string
    day = @date[0..1]
    month = @date[2..3]
    year = @date[4..5]
  end


end
