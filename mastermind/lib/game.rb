module MasterMind
	class Game
	attr_reader :player, :board, :computer, :turn
	def initialize(player = Player.new(""), board = Board.new(generate_code))
		@board = board
		@player = player
		#@computer = Computer.new
		@turn = 1
	end

	def solicit_move
		"#{player.name} enter 5 unique letters (case sensitive) a-h"
	end

	def gets_move(move=gets.chomp)
		while (move.length!=5 || !correct_input(move))
			puts "Invalid String"
			puts solicit_move
			move=gets.chomp
		end
		move.split("")
	end

	def correct_input(move)
		return move.match(/[a-h]{5}/) && ("a".."h").all?{|c| move.count(c)<=1}
	end

	def game_over_message(a_win)
		puts "The code is: " + board.code.join("")
		return "Congratulations #{player.name} you win!" if a_win
		return "#{player.name} you lose!"
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
end