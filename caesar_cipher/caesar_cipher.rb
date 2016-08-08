require 'sinatra'
require 'sinatra/reloader'

get '/' do
	message = params['message'].to_s
	shift = params['shift'].to_i
	encoded_message = caesar_cipher(message, shift)
	erb :index, :locals => {:encoded_message => encoded_message} 
end

def caesar_cipher(text, shift)
	text.chars.map do |c|
		if c.match(/[a-zA-Z]/)
			if c == c.upcase
				base = 'A'.ord
			else
				base = 'a'.ord
			end
			(((c.ord - base) + shift) % 26 + base).chr
		else
			c
		end
	end.join
end