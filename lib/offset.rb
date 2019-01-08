require 'date'
require 'pry'

class Offset

  attr_accessor :date,
                :a,
                :b,
                :c,
                :d


  def initialize(date = nil)
    set_date(date)
    getting_offset_from_date
    assigning_numbers_to_letters
  end

  def set_date(date = nil)
    if date
      @date = date.to_s
    else
      @date = format_date_to_DDMMYY
    end
  end

  def format_date_to_DDMMYY
    Date.today.strftime("%d%m%y")
  end

  def getting_offset_from_date
    (@date.to_i * @date.to_i).to_s[-4..-1]
  end

  def assigning_numbers_to_letters(four = getting_offset_from_date)
    @a = four[0].to_i
    @b = four[1].to_i
    @c = four[2].to_i
    @d = four[3].to_i
  end


end
