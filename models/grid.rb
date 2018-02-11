class Grid
  attr_accessor :size_x, :size_y

  def initialize(size_x, size_y)
    @size_x = size_x
    @size_y = size_y
  end

  def legal_coordinate?(x, y)
    return false if x < 0 or x >= size_x
    return false if y < 0 or y >= size_y
    true
  end
end