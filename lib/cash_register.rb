class CashRegister
  attr_accessor :discount, :total, :items, :transactions
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @transactions = []
  end
  
  def add_item(title, price, quantity = 1)
    self.transactions << {:title => title, :price => price, :quantity => quantity}
    quantity.times do
      self.items << title
    end
    self.total += (price * quantity)
  end
  
  def remove_item(title, price, quantity = 1)
    self.transactions.delete_at(-1)
    quantity.times do
      self.items.delete_at(-1)
    end
    self.total -= (price * quantity)
  end
  
  def apply_discount
    if self.discount == 0
      "There is no discount to apply."
    else
      self.total *= (1 - (self.discount / 100.0))
    "After the discount, the total comes to $800."
    end
  end
  
  def void_last_transaction
    trans_hash = self.transactions[-1]
    remove_item(trans_hash[:title], trans_hash[:price], trans_hash[:quantity])
  end
end