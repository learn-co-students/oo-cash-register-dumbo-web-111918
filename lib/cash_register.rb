require 'pry'

class CashRegister

  attr_accessor :total, :discount, :list_of_items


  def initialize(discount=0)
    @total = 0
    @discount = discount
    @list_of_items = []
    @item_prices = []
  end

  def add_item(title, price, quantity = 1)
      @total += (price*quantity)
      quantity.times do
        @list_of_items << title
      end
      @item_prices << (price*quantity)
  end

  def apply_discount
    if @discount > 0
      @total *= (1 - (@discount.to_f/100))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @list_of_items
  end

  def void_last_transaction
    @total -= @item_prices[-1]
  end


end
