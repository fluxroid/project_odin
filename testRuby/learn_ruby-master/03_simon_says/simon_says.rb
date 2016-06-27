def echo(word)
	word
end

def shout(word)
	word.upcase
end

def repeat(word, n=2)
	((word + " ") * n).strip 
end

def start_of_word(word, n)
	word[0...n]
end

def first_word(word)
	word.split.first
end

def titleize(word)
	words = word.split
	num = 0
	words.each do |word|
		unless num != 0 && (word == "the" || word == "over" || word == 
			"and")
			word.capitalize!
		end
		num+=1
	end
	words.join(" ").strip
end
