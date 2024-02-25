class Board

  def initialize(difficulty = :easy)
    @difficulty = difficulty
    # create a ready-to-solve sudoku puzzle
  end

  def generate_pattern
    # shuffle numbers on a loop until valid is true
  end

  def hide_numbers
    # substitute random numbers for zeroes depending on level
  end

  def valid_vertical

  end

  def valid_numbers?
    # if all 3 dimensions are valid placements, true
    # horizontal validity is ensured upon row generation
    if valid_vertical && valid_sector
      true
    end
  end

  def number_of_givens
    givens = 0
    if difficulty == :easy
      givens = 27
    elsif difficulty == :medium
      givens = 22
    else
      givens = 17
    end
    givens
  end

  def generate_grid
    # shovels the 9 arrays into a single array
    grid = []
    9.times do
      grid << generate_row
    end
    grid
  end

  def print_grid
    # prints puzzle neatly to terminal
    generate_grid.each do |row|
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
board.print_grid