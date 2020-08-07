def stock_picker(stocks)
  best_buying_day = 0
  best_selling_day = 1
  profit = stocks[best_selling_day] - stocks[best_buying_day]
  possible_buying_days = stocks

  possible_buying_days.each_with_index do |buying_day_price, buying_day|
    first_possible_selling_day = buying_day + 1
    possible_selling_days = stocks[first_possible_selling_day..-1]

    possible_selling_days.each_with_index do |selling_day_price, selling_day| 
      potential_profit = selling_day_price - buying_day_price
      if potential_profit > profit
        profit = potential_profit
        best_buying_day = buying_day
        best_selling_day = first_possible_selling_day + selling_day
      end
    end
  end

  [best_buying_day, best_selling_day]
end

p stock_picker([2,5,1]) # [0,1]
p stock_picker([5,2,1]) # [1,2]
p stock_picker([2, 1, 5, 3]) # [1,2]
p stock_picker([2, 5, 1, 3]) # [0,1]
p stock_picker([5, 2]) # [0,1]
p stock_picker([5, 2, 1]) # [1,2]
p stock_picker([17,3,6,9,15,8,6,1,10]) # [1,4]