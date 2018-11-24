require 'pry'

class CashRegister
attr_accessor :discount, :total, :cart, :last_transaction
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @cart = []
  end



  def add_item(title, price, quantity= 1)
if quantity > 1
  self.total += (price * quantity)
else
    self.total += price
  end
  @cart << [title, price, quantity]
  self.last_transaction = price * quantity

  #binding.pry
end
def apply_discount

  if self.discount != 0

  discount_float = @discount.to_f/ 100.0
  new_total_float =self.total.to_f
  new_discount = new_total_float * discount_float
  new_total = new_total_float -= new_discount
@total = new_total.to_i
#binding.pry


return "After the discount, the total comes to $#{@total}."

else
  return "There is no discount to apply."
end

end

def items
  items_in_cart = []
  cart.select do |item, price, quantity|
    if quantity > 1
      i = quantity
          until i == 0 do
            items_in_cart << item
            i -= 1
                    end
        else
          items_in_cart << item
          end
        end
        items_in_cart
end

def void_last_transaction
  new_total = self.total - self.last_transaction
  @total = new_total
#binding.pry
end
end
