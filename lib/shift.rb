require './lib/key'
require './lib/offset'

class Shift

  attr_reader :key, :offset
  attr_accessor :a, :b, :c, :d

  def initialize(key, offset)
    @key = key
    @offset = offset
    find_each_shift
  end

  def find_each_shift
    @a = key.a + offset.a
    @b = key.b + offset.b
    @c = key.c + offset.c
    @d = key.d + offset.d
  end

end
