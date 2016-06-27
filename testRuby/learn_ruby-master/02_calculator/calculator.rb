def add(x, y)
	x + y
end

def subtract(x, y)
	x - y
end

def sum(a)
	z = 0 
	a.each{|x| z+=x}
	z
end

def multiply(*args)
	num = 1
	args.each{|n| num *= n}
	num
end

def power(x,y)
	x ** y
end

def factorial(num)
	if num == 1 || num == 0
		1
	else
		sum = 1
		num.times do |n|
			sum *= (n + 1)
		end
		sum
	end
end