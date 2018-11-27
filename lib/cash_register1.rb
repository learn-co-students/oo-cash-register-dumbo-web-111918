class CashRegister
  attr_accessor :total, :discount, :quantity, :title, :price, :last_transaction
  #need to do setter and getter with optional arguments in initialization?
  def initialize(total = 0, discount = 20)
    @total = total
    @discount = discount
  end

  def total
   @total #setting attr_accessor :total returns total automatically
  end

  def add_item(title, price, quantity = 1)
    self.total = self.total + (price * quantity)
    #have to use self.total when refer to method inside another method
  end

  def apply_discount
    if @discount > 0
      @total = @total * (100 - discount)/100
      "After the discount, the total comes to $#{@total}."
    else
       "There is no discount to apply."
     end
  end

  def items
    @added_items = []
     i = 0
    while i <= @quantity
      @added_items << add_item(title)
      i = i + 1
    end
    @added_items
  end

  def void_last_transaction
    last_transaction = add_item(title, price, quantity = 1)
    self.total = self.total - last_transaction
  end
end
#cash_register = CashRegister.new
#cash_register_with_discount = CashRegister.new(20)
