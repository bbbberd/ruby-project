def stock_picker(prices)
  # Initialize variables to track the maximum profit and best days
  best_days = [0, 0]
  max_profit = 0

  # Iterate through the prices array
  prices.each_with_index do |buy_price, buy_day|
    # Compare with subsequent days
    (buy_day + 1...prices.length).each do |sell_day|
      sell_price = prices[sell_day]
      profit = sell_price - buy_price

      # Update best days if a higher profit is found
      if profit > max_profit
        max_profit = profit
        best_days = [buy_day, sell_day]
      end
    end
  end

  best_days
end

# Example usage
puts stock_picker([17,3,6,9,15,8,6,1,10]).inspect
# Output: [1, 4]

