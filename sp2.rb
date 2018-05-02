def stock_picker(stocks)
  return nil if stocks.length < 2
  @days = stocks.first(2)
  stocks.map.with_index do |buy_day, i|
    stocks[i+1..stocks.length].each do |sell_day|
      @days = [buy_day,sell_day] if sell_day - buy_day > @days[1] - @days[0]
    end
  end
  return @days
end