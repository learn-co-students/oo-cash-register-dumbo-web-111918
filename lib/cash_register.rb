
require 'pry'
class CashRegister
  attr_accessor :total, :employee_discount, :title, :price, :quantity, :list, :last_transaction
# i had employee discount and total in wrong order in iniitalize
# I dont need splat because pours into array, just set employee_discount = 0
  def initialize(employee_discount = 0, total = 0) #dont need splat becasue pours into array
    #in test, they provide the 20, default discount set it equal to 0
    @total = total
    @employee_discount = employee_discount #if you are passing it in when you create
    #@employee_discount = 20
    #@list = list
    @list = []
  end

  def discount
    @employee_discount
  end

  def add_item(title, price, quantity = 1)
   #@list << [title] * quantity
   quantity.times do #do this a set number of times
    @list << title
   end #what do i want to do quantity times? add eggs eggs eggs etc
    @last_transaction = price * quantity
    self.total=(self.total + @last_transaction)
     end
      #binding.pry

  def apply_discount
    #here just to use to_f on numderator to get a float
    discount = (self.employee_discount.to_f/100)
    discounted = 1 - discount

    if employee_discount > 0
       #binding.pry
    self.total = (total * discounted).to_i

      #item_discounted = self.add_item(title, price, quantity = 1) * (1 - discount)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end


  def items
    # i = 0
    # while i <= @quantity
    #   @list << add_item(title)
    #   i = i + 1
    # end
    # @list
    @list
    #@list.flatten
  end

@last_transaction

  def void_last_transaction
    #self.total=(self.total - add_item(title, price, quantity = 1))
    #dont call add_item as title price undefined, only defined inside that method, unless i store whole
    #thing as last item
    self.total = self.total - @last_transaction
  end
end
cash_register = CashRegister.new
#cash_register = cash_register.discount
#sum = cash_register.apply_discount
#binding.pry

#how do you call binding.pry in learn, put binding.pry in and call learn
#you can also call lib/cash_register.rb and put binding.pry at end


