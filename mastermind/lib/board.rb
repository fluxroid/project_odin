#module MasterMind
require_relative "slot.rb"
	class Board
		attr_reader :grid
	  def initialize(input = {}, code=[])
	    @grid = input.fetch(:grid, default_grid)
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

	  private 

	  def default_grid
	  	Array.new(12){ Array.new(5) {Slot.new} }
	  end
	end