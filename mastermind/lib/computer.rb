#module MasterMind
	class Computer
		def generate_code
			colors = ['a','b','c','d','e','f','g','h']
			3.times do
				index = rand(0...colors.length)
				colors.delete_at(index)
			end
			colors.shuffle
		end
	end
#end