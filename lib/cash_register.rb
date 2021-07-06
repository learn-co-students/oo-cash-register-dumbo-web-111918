require 'pry'
class CashRegister
attr_accessor :total, :discount, :last_transaction
attr_reader :items
def initialize(discount=0)
  @items = []
  @total = 0
  @discount = discount

end

def add_item(title,price,quantity=1)
  @last_transaction = price*quantity
  self.total += price*quantity
    quantity.times do
      @items << title
end
end



def apply_discount
  if discount > 0
    self.total = self.total - (total * (discount/100.to_f))
    "After the discount, the total comes to $#{self.total.to_i}."
  else
    "There is no discount to apply."
end
end
# it 'returns an array containing all items that have been added' do
  #   new_register = CashRegister.new
    #   new_register.add_item("eggs", 1.99)
  #   new_register.add_item("tomato", 1.76, 3)
  #   expect(new_register.items).to eq(["eggs", "tomato", "tomato", "tomato"])
  # end
def void_last_transaction
@total = @total - @last_transaction

end
end
