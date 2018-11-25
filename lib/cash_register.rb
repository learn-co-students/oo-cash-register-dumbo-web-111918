
class CashRegister
  attr_accessor :total, :discount, :quantity, :last_transaction, :items
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    @total += price * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount > 0
      disc = @total * (20.0/100.0) #1000 * 20/100 = 200
      @total = @total - disc #@total(1000) - disc(200)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end

  def void_last_transaction
   self.total = self.total - self.last_transaction
 end
end
