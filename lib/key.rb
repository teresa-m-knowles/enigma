class Key

  attr_reader :numbers

  attr_accessor :a,
                :b,
                :c,
                :d

  def initialize(optional_key = nil)
    if optional_key
      @numbers = optional_key
    else
       @numbers = generate_numbers
    end
    split_numbers
  end

  def generate_numbers
    string = ""
     5.times do
       string += Random.new.rand(9).to_s
     end
     string
  end

  def split_numbers
    split = numbers.split('')
    @a = split[0..1].join.to_i
    @b = split[1..2].join.to_i
    @c = split[2..3].join.to_i
    @d = split[3..4].join.to_i
  end




end
