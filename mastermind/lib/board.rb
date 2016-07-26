module MasterMind
	class Board
		attr_reader :grid
	  def initialize(input = {}, code=[])
	    @grid = input.fetch(:grid, default_grid)
	    @code = code
	  end

	  private 

	  def default_grid
	  	Array.new(12){Array.new(5){slot.new}}
	  end
	end
end