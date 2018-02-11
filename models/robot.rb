class Robot
  attr_accessor :grid, :direction, :x, :y

  def initialize(grid)
    @grid = grid
  end

  def place(x, y, direction)
    return if !grid.legal_coordinate?(x, y)

    @x = x
    @y = y
    @direction = direction
  end

  def left
    return unless placed_on_grid?

    case direction
    when :north
      @direction = :west
    when :west
      @direction = :south
    when :south
      @direction = :east
    when :east
      @direction = :north
    end
  end

  def right
    return unless placed_on_grid?

    case direction
    when :north
      @direction = :east
    when :east
      @direction = :south
    when :south
      @direction = :west
    when :west
      @direction = :north
    end
  end

  def move
    return unless placed_on_grid?

    new_x, new_y = calculate_move_coordinate
    return if !grid.legal_coordinate?(new_x, new_y)

    @x = new_x
    @y = new_y
  end

  def report
    return unless placed_on_grid?

    [x, y, direction]
  end

private

  def calculate_move_coordinate
    new_x = x
    new_y = y

    new_y += 1 if direction == :north
    new_x += 1 if direction == :east
    new_y -= 1 if direction == :south
    new_x -= 1 if direction == :west

    [new_x, new_y]
  end

  def placed_on_grid?
    x && y && direction
  end
end