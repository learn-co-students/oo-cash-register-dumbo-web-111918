require "pry"

class CashRegister

	attr_accessor :total, :discount

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
		@item_price = []
	end

	def add_item(title, price, quantity = 1)
		@total += (price * quantity)
		quantity.times do 
			@items.push(title)
			@item_price.push(price)
		end
	end

	def apply_discount
		disc = self.total * (@discount / 100.0)
		self.total -= disc
		if @discount == 0
			"There is no discount to apply."
		else
			"After the discount, the total comes to $#{@total.to_i}."
		end
	end

	def items 
		@items
	end

	def void_last_transaction
		self.total -= @item_price[-1]
	end
end	

cash = CashRegister.new

# binding.pry
# 0
