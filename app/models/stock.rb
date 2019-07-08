class Stock < ApplicationRecord
	
	def self.new_from_lookup(ticker_symbol)
		begin
			looked_up_stock = StockQuote::Stock.quote(ticker_symbol)
			#price = strip_commas(looked_up_stock.l) this will done below rails 5 because of decimal
			new(name: looked_up_stock.company_name, ticker: looked_up_stock.symbol, last_price: looked_up_stock.latest_price)
		rescue Exception => e
			return nil
		end
	end

	#def price
	 #   closing_price = StockQuote::Stock.quote(ticker).close
	  #  return "#{closing_price} (closing)" if closing_price
	   # opening_price = StockQuote::Stock.quote(ticker).open
	    #return "#{opening_price (opening)}" if opening_price
	    #"Unavailable"
	#end
end
