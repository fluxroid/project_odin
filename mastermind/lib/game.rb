#module MasterMind
require_relative "board.rb"
	class Game
	attr_reader :player, :board, :computer, :turn
	def initialize(board = Board.new(generate_code))
		@board = board
		#add a player class
		#@computer = Computer.new
		@turn = 1
	end

	def solicit_move
		"#Enter 5 unique letters (case sensitive) a-h"
		#add a more strict check for valid strings
	end

	def gets_move(move=gets.chomp)
		while (move.length!=5)
			puts "Invalid String"
			puts solicit_move
			move=gets.chomp
		end
		move.split("")
	end

	def game_over_message(a_win)
		return "Congratulations you win!" if a_win
		return "You lose!"
	end

	def play
		#add option to insert own player code and cpu guesses
		board.current_grid
		while turn<=12
			puts ""
			puts solicit_move
			input = gets_move
			board.update_board(input,turn)
			puts ""
			board.current_grid
			puts ""
			if board.match(input)
				puts game_over_message(true)
				return
			else
			  puts "#{board.correct_letters(input)} letter(s) are correctly guessed"
			  puts "#{board.correct_spaces(input)} letter(s) are in the right spot"
			end
			@turn+=1
		end
		puts game_over_message(false)
		return
	end

	private
	def generate_code
			letters = ['a','b','c','d','e','f','g','h']
			3.times do
				index = rand(0...letters.length)
				letters.delete_at(index)
			end
			letters.shuffle
	end
end
game = Game.new
game.play