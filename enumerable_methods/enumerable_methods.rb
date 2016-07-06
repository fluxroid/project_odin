module Enumerable
	def my_each
		self.length.times{|i| yield(self[i])} if self.is_a? Array
		self.length.times{|i| yield(self.keys[i], self.values[i]) } if self.is_a? Hash
		self
	end

	def my_each_index
		self.length.times { |i| yield(self[i], i) } if self.is_a? Array
		self.length.times { |i| yield(self.keys[i], self.values[i], i) } if self.is_a? Hash
		self
	end

	def my_select
		if self.is_a? Array
			a = []
			self.my_each_index {|item, index| a << self[index] if yield(item)}
			return a
		elsif self.is_a? Hash
			a = {}
			self.my_each {|key, value| a[key] = value if yield(key, value)}
			return a
		end
		self
	end

	def my_all?
		if self.is_a? Array
			self.my_select{|i| yield(i)} == self ? (return true) : (return false)
		elsif self.is_a? Hash
			self.my_select{ |k, v| yield(k, v)} == self ? (return true) : (return false)
		end
		self
	end

	def my_any?
		if self.is_a? Array
			self.my_select{|i| yield(i)}.empty? ? (return false) : (return true)
		elsif self.is_a? Hash
			self.my_select{|k, v| yield(k,v)}.empty? ? (return false) : (return true)
		end
		self
	end

	def my_none?
		if self.is_a? Array
			return !self.any? {|i| yield(i)}
		elsif self.is_a? Hash
			return !self.any? {|k,v| yield(k,v)}
		end
		self
	end

	def my_count
		if self.is_a? Array
			return self.my_select{|i| yield(i)}.length
		elsif self.is_a? Hash
			return self.my_select{|k,v| yield(k,v)}.length
		end
		self
	end

	def my_map()
		if self.is_a? Array
			b = []
			self.my_each{|i| b << yield(i)}
			return b
		elsif self.is_a? Hash
			b = {}
			self.my_each{|k,v| b << yield(k,v)}
			return b
		end
	end

	def my_inject(p = nil)
		p = self[0] if !p

		self.my_each_index { |i, n| p = yield(p, i) unless (p == self[0] && n == 0) }
		p
	end
end

	def multiple_els(array)
		array.my_inject{|tot, i| tot*= i}
	end		
puts multiple_els([2,4,5])
#should return 40