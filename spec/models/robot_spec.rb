require 'spec_helper'
require './models/robot.rb'

describe Robot do
  let(:grid) { Grid.new(5, 5) }
  let(:robot) { Robot.new(grid) }

  def verify(robot, x, y, direction)
    expect(robot.x).to eq(x)
    expect(robot.y).to eq(y)
    expect(robot.direction).to eq(direction)
  end

  describe "#place" do
    context "when placed outside of grid's limits" do
      it "does not do anything" do
        robot.place(-1, -1, :north)

        verify(robot, nil, nil, nil)
      end
    end

    context "when placed inside grid" do
      it "sets the coordinates and directions of the robot" do
        robot.place(0, 0, :north)

        verify(robot, 0, 0, :north)
      end
    end
  end

  describe "#left" do
    context "when not placed on grid" do
      it "does not do anything" do
        robot.left

        verify(robot, nil, nil, nil)
      end
    end

    it "turns west when facing north" do
      robot.place(0, 0, :north)

      robot.left

      expect(robot.direction).to eq(:west)
    end

    it "turns south when facing west" do
      robot.place(0, 0, :west)

      robot.left

      expect(robot.direction).to eq(:south)
    end

    it "turns east when facing south" do
      robot.place(0, 0, :south)

      robot.left

      expect(robot.direction).to eq(:east)
    end

    it "turns north when facing east" do
      robot.place(0, 0, :east)

      robot.left

      expect(robot.direction).to eq(:north)
    end
  end

  describe "#right" do
    context "when not placed on grid" do
      it "does not do anything" do
        robot.right

        verify(robot, nil, nil, nil)
      end
    end

    it "turns east when facing north" do
      robot.place(0, 0, :north)

      robot.right

      expect(robot.direction).to eq(:east)
    end

    it "turns south when facing east" do
      robot.place(0, 0, :east)

      robot.right

      expect(robot.direction).to eq(:south)
    end

    it "turns west when facing south" do
      robot.place(0, 0, :south)

      robot.right

      expect(robot.direction).to eq(:west)
    end

    it "turns north when facing west" do
      robot.place(0, 0, :west)

      robot.right

      expect(robot.direction).to eq(:north)
    end
  end

  describe "#move" do
    context "when not placed on grid" do
      it "does not do anything" do
        robot.move

        verify(robot, nil, nil, nil)
      end
    end

    context "when moving off the grid" do
      it "does not do anything" do
        robot.place(0, 0, :south)

        robot.move

        verify(robot, 0, 0, :south)
      end
    end

    it "moves north when facing north inside the grid" do
      robot.place(2, 2, :north)

      robot.move

      verify(robot, 2, 3, :north)
    end

    it "moves south when facing south inside the grid" do
      robot.place(2, 2, :south)

      robot.move

      verify(robot, 2, 1, :south)
    end

    it "moves east when facing east inside the grid" do
      robot.place(2, 2, :east)

      robot.move

      verify(robot, 3, 2, :east)
    end

    it "moves west when facing west inside the grid" do
      robot.place(2, 2, :west)

      robot.move

      verify(robot, 1, 2, :west)
    end
  end

  describe "#report" do
    context "when not placed on grid" do
      it "does not do anything" do
        expect(robot.report).to be_nil
      end
    end

    context "when placed on grid" do
      it "returns the coordinates and direction" do
        robot.place(1, 2, :west)

        x, y, direction = robot.report

        expect(x).to eq(1)
        expect(y).to eq(2)
        expect(direction).to eq(:west)
      end
    end
  end
end