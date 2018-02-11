require 'spec_helper'
require './models/grid.rb'

describe Grid do
  describe "#legal_coordinate?" do
    it "returns true when x and y are within the grid's limits" do
      grid = Grid.new(5, 5)

      result = grid.legal_coordinate?(0, 0)

      expect(result).to eq(true)
    end

    it "returns false when x is less than 0" do
      grid = Grid.new(5, 5)

      result = grid.legal_coordinate?(-1, 0)

      expect(result).to eq(false)
    end

    it "returns false when x is greater than max size of grid" do
      max_size = 5
      grid = Grid.new(max_size, 5)

      result = grid.legal_coordinate?(max_size, 0)

      expect(result).to eq(false)
    end

    it "returns false when y is less than 0" do
      grid = Grid.new(5, 5)

      result = grid.legal_coordinate?(0, -1)

      expect(result).to eq(false)
    end

    it "returns false when y is greater than max size of grid" do
      max_size = 5
      grid = Grid.new(5, max_size)

      result = grid.legal_coordinate?(0, max_size)
      expect(result).to eq(false)
    end
  end
end