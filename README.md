# Netflix Robot Assignment

## To setup:
> bundle install

## To run in irb:
```
bash# irb
irb> require './simulator.rb'
irb> robot = Simulator.create(5, 5) # will create a robot on a 5x5 grid
```

Commands that the robot will understand (as per specs):

```
robot.place(x, y, direction)
	x and y are numbers
	direction is a symbol: :north, :east, :west, :south

robot.move
robot.left
robot.right
robot.report
```

## To run tests:
> bundle exec rspec