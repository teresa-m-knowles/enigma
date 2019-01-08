require './lib/key'
require './lib/offset'

class Shift

  attr_reader :key,
              :offset,
              :a,
              :b,
              :c,
              :d

  def initialize(key = nil, offset = nil)
    @key = key
    @offset = offset
    find_each_shift
  end

  def find_each_shift
    if key && offset
      @a = key.a + offset.a
      @b = key.b + offset.b
      @c = key.c + offset.c
      @d = key.d + offset.d
    end
  end

end
