require 'pry'

class CashRegister
  def initialize(discount = nil)
    @discount = discount
    @total = 0
    @items = []
  end

  attr_accessor :total, :discount, :last_item_price

  def add_item(title, price, quantity = nil)
    if quantity != nil
      self.last_item_price = price * quantity
      self.total += price * quantity if quantity != nil
      for i in 1..quantity
        self.items << title
      end
    else
      self.last_item_price = price
      self.total += price
      self.items << title
    end
  end

  def apply_discount
    if self.discount == nil
      "There is no discount to apply."
    else
      self.total = (self.total - (self.total * (discount * 0.01))).to_i
      "After the discount, the total comes to $#{self.total}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    self.total -= self.last_item_price
  end

end
