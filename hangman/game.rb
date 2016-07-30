require_relative "word.rb"

class Game
	def initialize
		@count = 6
		@word = Word.new
	end

	def draw_stick_man
		case @count
		when 5
			"  O"
		when 4
			"  O\n  T"
		when 3
			"  O\n/ T"
		when 2
			"  O\n/ T l"
		when 1
			"  O\n/ T l\n I"
		when 0
			"  O\n/ T l\n I I"
		else
			"   "
		end
	end

	def display
		puts "---------------------------------"
		puts "HANGMAN"
		puts ""
		puts  "# Of Guesses Left: #{@count}"
		puts draw_stick_man
		puts ""
		puts @word.display_choosen_letters
		puts ""
		puts @word.start_word
	end

	def get_input
		puts "Enter a valid letter"
		letter = gets.downcase.chomp
		while(letter.length!=1 or @word.said_letters[letter]==true)
			puts "Try Again Enter a valid letter"
			letter = gets.downcase.chomp
		end
		letter
	end

	def game_over
		puts "-----------------------------------"
		puts draw_stick_man
		puts ""
		puts @word.display_choosen_letters
		puts ""
		puts "The word is: "+@word.correct_word
		puts ""
		puts "You win!" if @word.match
		puts "You lose!" if not @word.match
	end


	def play
		puts "Welcome To the Game of Hang Man "
		while(@count>0 && !@word.match)
			display
			letter = get_input
			outcome = @word.guess(letter)
			if outcome.length > 0
				@word.set(outcome,letter)
			else
				@count-=1
			end
		end
		game_over
	end

end