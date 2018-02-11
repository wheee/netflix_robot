require './models/grid.rb'
require './models/robot.rb'

class Simulator
  def self.create(grid_size_x, grid_size_y)
    grid = Grid.new(grid_size_x, grid_size_y)
    Robot.new(grid)
  end

  SIMULATION_1 = {
    grid_size_x: 5,
    grid_size_y: 5,
    commands: [
      { action: :place, params: [1, 2, :east] },
      { action: :move },
      { action: :move },
      { action: :left },
      { action: :move },
      { action: :report }
    ]
  }

  def self.run(simulation_parameters=SIMULATION_1)
    grid = Grid.new\
      simulation_parameters[:grid_size_x],
      simulation_parameters[:grid_size_y]
    robot = Robot.new(grid)

    simulation_parameters[:commands].each do |command|
      robot.send(command[:action], *command[:params])
    end

    robot
  end
end