require "pry"
class CashRegister

  attr_accessor :total, :discount, :price

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @title = []
    @transaction = []
  end

  def price=(price)
    @price = price
  end

  def add_item(title, price, quantity = 1)
    quantity.times {@title << title}
    quantity.times{@transaction << price}
    self.total += price * quantity
  end

  def apply_discount
    discount_percentage = @discount.to_f / 100.0
    @total -= self.total * discount_percentage
    if @discount == 0
      "There is no discount to apply."
    else "After the discount, the total comes to $#{@total.to_i}."
   end
  end

  def items
    @title
  end

  def void_last_transaction
    last_item = @transaction.pop
    @total -= last_item.to_f
  end

end
