class CashRegister
  attr_accessor :total, :discount
  
  def initialize(total = 0, discount = 20)
    @total = total
    @discount = discount
    @basquet = []
    @last_transaction = 0
  end 
  
  def add_item(title, price, quantity = 1)
    self.total += price*quantity
    quantity.times do 
      @basquet << title
    end 
    @last_transaction = price*quantity
  end
  
  def apply_discount
    self.total = ((self.total.to_f)*0.8).round
    
  end 
  
  def items
    @basquet
  end 
  
  def void_last_transaction
    self.total -= @last_transaction
  end 
  
    
end 

