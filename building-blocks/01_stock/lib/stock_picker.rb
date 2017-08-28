#stock_picker method
def stock_picker(ary)
  return nil if ary.empty?
  sell = 0
  firm_buy = 0
  ary.each do |pot_buy| #potential buy, not ganja buy haha
    buy_ind = ary.index(pot_buy)
    buy_ind.upto(ary.length) do |index|
      if ary[index].to_i - pot_buy.to_i > sell
        sell = ary[index]
        firm_buy = pot_buy
      end
    end
  end

  result = [ary.index(firm_buy), ary.index(sell)]

  print result
  #below this line the code is just fancy extra strings
  puts " "
  puts "Best day to buy is day " + ary.index(firm_buy).to_s + " at price " + firm_buy.to_s + " and best day to sell is day " + ary.index(sell).to_s + " at price " + sell.to_s + " for profit of " + (sell - firm_buy).to_s
  return result
end

stock_picker([17,3,6,9,15,8,6,1,10])

#done
