def bubble_sort(list)
	return list if list.size <= 1
	swapped = true
	while swapped do
		swapped = false
		0.upto(list.size-2) do |i|
			if list[i] > list[i+1]
				list[i], list[i+1] = list[i+1], list[i]
				swapped = true
			end
		end
	end
	list	
	end

def bubble_sort_by(list)
	return list if list.size <= 1
	swapped = true
	while swapped do
		swapped = false
	0.upto(list.size-2) do |i|
		if yield(list[i], list[i+1])> 0
			list[i], list[i+1] = list[i+1], list[i]
			swapped = true
		end
	end
end
	list
end


bubble_sort_by(["hi","hello","hey"]) do |left,right|
	left.length - right.length
end