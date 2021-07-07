# require "pry"
class CashRegister
    attr_accessor :name, :discount, :items, :last_transaction
    attr_reader :total

    

    def initialize(discount =0)
        @total= 0
        @discount = discount
        @items = []
        @last_transaction = 0
    end
    
    #total is the getter / writer method which will write over @total
    def total=(total)
        @total = total
        return @total
    end 

    def add_item(title, price, quantity=1)
        self.total += (price * quantity)
        @last_transaction = price * quantity
        quantity.times do
          @items << title
        end
          
          return @total
    end 

    def apply_discount   
        if @discount == 0
            "There is no discount to apply."
        else
        self.total = (@total -(@total * (@discount.to_f / 100))).to_i
            "After the discount, the total comes to $#{total}."
        end
    end

    def items 
      return @items
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end
end
