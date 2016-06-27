def translate(words)
	vowels = ['a','e','u','i','o','y']
	s = words.split
	s.collect! do |word|
		if vowels.include?(word[0])
			word << 'ay'
		else
			while not vowels.include?(word[0])
				if word[0..1] == "qu"
					consonant = word[0..1]
					word = word[2..-1]
				else
					consonant = word[0]
					word = word[1..-1]
				end
				word << consonant
			end
			word << 'ay'
		end
	end
	s.join(" ")
end