module MasterMind
	class Board
		attr_reader :grid, :code
	  def initialize(code=[])
	    @grid = default_grids
	    @code = code
	  end

	  def update_board(input, turn)
	  	grid[turn-1].each_with_index do |slot, index|
	  		slot.value = input[index]
	  end


	  end

	  def current_grid
	  	grid.each do |row|
	  		puts row.map{|slot| slot.value.empty? ? "_" : slot.value}.join(" ")
	  	end
	  end


	  def match(input)
	  	return correct_letters(input) == 5 && correct_spaces(input) == 5
	  end

	  def correct_letters(input)
	  count = 0
	  @code.each do |letter|
	  	count+=1 if input.include? letter
	  end
	  count
	  end
      
	  def correct_spaces(input)
	  count = 0
	  @code.each_with_index do |letter, index|
	  	count+=1 if letter == input[index]
	  end
	  count
	  end

	  private 
	  def default_grids
	  	Array.new(12){ Array.new(5) {Slot.new} }
	  end
	end
end