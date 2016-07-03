def stock_picker(stocks)
	max_profit, sell_date, buy_date = 0,0,0
	i = 0
	while i < stocks.size - 1 do 
		k = i + 1
		while k < stocks.size do
			if stocks[k] - stocks[i] > max_profit
				purchase_date, sell_date = i, k
				max_profit = stocks[k] - stocks[i]
			end
		k += 1
		end
		i += 1
	end
		[purchase_date,sell_date]
	end

puts stock_picker([17,3,6,9,15,8,6,1,10])
#should return [1,4]