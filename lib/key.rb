class Key

  attr_reader :a, b, c, d
  def initialize
    @a = Random.new.rand(9)
    @b = Random.new.rand(9)
    @c = Random.new.rand(9)
    @d = Random.new.rand(9)
  end

  def abcd
    return a,b,c,d
  end




end
