class Word
	attr_accessor :start_word, :correct_word, :said_letters

	def initialize
		@correct_word = pick_random_word("5desk.txt").downcase
		@start_word = "_"*correct_word.length
		@said_letters = Hash.new(false)
	end

	def guess(letter)
		@said_letters[letter] = true
		indices = (0...correct_word.length).find_all{ |i| correct_word[i,1] == letter}
		return indices
	end

	def set(indices, letter)
		indices.each {|index| start_word[index] = letter}
	end

	def display_choosen_letters
		"Said Letters: "+@said_letters.keys.join(" ")
	end

	def match
		@start_word == @correct_word
	end

	private 

	def pick_random_word(text)
		word = File.readlines(text).sample.strip
		while (word.length>12 || word.length<5)
			word = File.readlines(text).sample.strip
		end
		word
	end
end