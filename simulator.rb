require './models/grid.rb'
require './models/robot.rb'

class Simulator
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