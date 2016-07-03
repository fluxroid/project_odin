# takes a word as the first argument and then an array of valid substrings (your dictionary)
# as the second argument. It should return a hash listing each substring (case insensitive)
# that was found in the original string and how many times it was found.

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substring(words, dict)
	results = Hash.new(0)
	words.downcase.split(' ').each do |word|
		dict.each do |dict_words|
			results[dict_words] += 1 if word[dict_words]
		end
	end
	results
end

puts substring("Howdy partner, sit down! How's it going?", dictionary)




