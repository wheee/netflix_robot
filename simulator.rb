require './models/grid.rb'
require './models/robot.rb'

class Simulator
  def self.create(grid_max_x, grid_max_y)
    grid = Grid.new(grid_max_x, grid_max_y)
    Robot.new(grid)
  end

  def self.run
    grid = Grid.new(5, 5)
    robot = Robot.new(grid)
    robot.place(1, 2, :east)
    robot.move
    robot.move
    robot.left
    robot.move
    robot.report

    robot
  end
end