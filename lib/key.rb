class Key

  attr_reader :numbers

  def initialize(*optional_key)
    @numbers = generate_numbers

  end

  def generate_numbers
    string = ""
     5.times do
       string += Random.new.rand(9).to_s
     end
     string
  end




end
