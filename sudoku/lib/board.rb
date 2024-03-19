require 'pry'

class Board
  attr_reader :pattern

  def initialize(difficulty = :easy)
    # create a ready-to-solve sudoku puzzle
    @difficulty = difficulty
    # @grid = generate_grid
    @solved_grid = generate_pattern
  end

  def generate_pattern # this function needs to be recursive
    grid = generate_grid
    if valid_placement?(grid)
      return
    end
    # until valid_placement?(grid)
    #   grid.map do |row|
    #     row.shuffle
    #   end
      # grid.generate_pattern
    # end
  end

  def hide_numbers
    # substitute random numbers for zeroes depending on level
  end

  def valid_numbers?(group)
    # check that numbers 1..9 appear exactly once in an array
    group.sort == [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end

  def create_columns(grid)
    # create an array of 9 empty arrays to represent the columns
    # iterate through rows
    # put the index 0 element of each row into the first array in the columns array
    columns = Array.new(9) {Array.new}
    grid.each do |row|
      row.each_with_index do | number, i |
        columns[i] << number
      end
    end
    columns
  end

  def valid_columns?(grid)
    # check that integers 1..9 appear in each column exactly once

    create_columns(grid).all? do |column|
      valid_numbers?(column)
    end
  end

  def create_sectors(grid)
    # initialize empty arrays to use for data manipulation
    # for row arrays 0-2
      # shovels elements 0-2 into sectors[0]
      # shovels elements 3-5 into sectors[1]
      # shovels elements 6-8 into sectors[2]
    # for row arrays 3-5
      # shovels elements 0-2 into sectors[3]
      # shovels elements 3-5 into sectors[4]
      # shovels elements 6-8 into sectors[5]
    # for row arrays 6-8
      # shovels elements 0-2 into sectors[6]
      # shovels elements 3-5 into sectors[7]
      # shovels elements 6-8 into sectors[8]
    count = 0
    sectors = Array.new(9) {Array.new}
    grid.each_slice(3) do |group| # group is an array of 3 "row" arrays
      group.each do |row|
        sectors[count] << row[0..2].flatten
        # require 'pry'; binding.pry
        sectors[count+1] << row[3..5]
        sectors[count+2] << row[6..8]
      end
      count += 3
    end
    sectors.map(&:flatten)
  end

  def valid_sectors?(grid)
    # check that integers 1..9 appear in each 3x3 section exactly once
    create_sectors(grid).all? do |sector|
      valid_numbers?(sector)
    end
  end

  def valid_placement?(grid)
    # if all 3 dimensions are valid placements, true
    # (horizontal validity is ensured upon row generation)
    if valid_columns?(grid) && valid_sectors?(grid)
      true
    else
      false
    end
  end

  # def number_of_givens
  #   givens = 0
  #   if difficulty == :easy
  #     givens = 27
  #   elsif difficulty == :medium
  #     givens = 22
  #   else
  #     givens = 17
  #   end
  #   givens
  # end 

  def generate_grid
    # generates 9 arrays/rows into a single array
    grid = []
    9.times do
      grid << generate_row
    end
    grid
  end

  def print_grid
    # prints puzzle neatly to terminal
    @grid.each do |row|
      p row
    end
  end

  def generate_row
    # creates 9 arrays of numbers 1 through 9
    (1..9).to_a
  end

  def example_grid
    p   [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0],
        [0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0]
  end
end


board = Board.new
# board.example_grid
# board.print_grid
p board.pattern