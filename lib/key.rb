class Key

  attr_reader :numbers,
              :a,
              :b,
              :c,
              :d

  def initialize(optional_key = nil)
    if optional_key
      @numbers = optional_key
    else
       @numbers = generate_numbers
    end
    set_numbers
  end

  def generate_numbers
    string = ""
     5.times do
       string += Random.new.rand(10).to_s
     end
     string
  end

  def split_numbers(numbers = @numbers)
    numbers.split('')
  end

  def set_a
    @a = split_numbers[0..1].join.to_i
  end

  def set_b
    @b = split_numbers[1..2].join.to_i
  end

  def set_c
    @c = split_numbers[2..3].join.to_i
  end

  def set_d
    @d = split_numbers[3..4].join.to_i
  end

  def set_numbers
    set_a
    set_b
    set_c
    set_d
  end

end
