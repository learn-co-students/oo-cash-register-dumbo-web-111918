class CashRegister
  attr_reader :items
  attr_accessor :total
  def initialize(discount = 0)
    @total = 0
    @employee_discount = discount
    @items = []
  end

  def discount
    @employee_discount
  end

  def add_item(title, price, quantity = 1)
    @last_transaction = price * quantity
    @total += @last_transaction
    (1..quantity).each do |i|
      @items.push(title)
    end
  end

  def apply_discount
    original_total = @total
    @total = @total - (@total*@employee_discount/100)
    if original_total == @total
      "There is no discount to apply."
    else
    "After the discount, the total comes to $#{@total}."
    end
  end

  def void_last_transaction
    @total = @total - @last_transaction
    :total
  end
end
