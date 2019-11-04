class CashRegister

  def initialize(discount = 0)
    @total = 0 
    @discount = discount
    @items_and_prices = []
    @items = []
    @subtotals_by_item = []
    #@item_and_subtotal_by_item = []
  end

  def apply_discount
    if @discount > 0
      self.total -= @total*(@discount/100.0)
      return "After the discount, the total comes to $#{self.total.to_i}."
    else 
      return "There is no discount to apply."
    end
  end

  def total
      @total
  end

  def total=(num)
    @total = num
  end

  def discount
    @discount
  end

  def add_item(title, price, quantity=1)
    @add_item = title
    @transaction_total = price*quantity
    @total += @transaction_total
    
    #Add individual item/price to list of item/prices 
    i = 1
    while i <= quantity
      @items_and_prices << {@add_item => price} #@transaction_total} 
      i+=1
    end
    @subtotals_by_item << @transaction_total
    #ADD item/price with sub-total by items
    #j = 1
    #while j <= quantity
      #@item_and_subtotal_by_item << {@add_item => @transaction_total}
      #j+= 1
    #end


  end

  def items
    @items_and_prices.each do |item_and_price|
      item_and_price.each do |item, price|
        @items << item
      end
    end
    return @items
  end

  def void_last_transaction
    @last_transaction = @subtotals_by_item.pop
    @total -= @last_transaction
    #@item_and_subtotal_by_item.each do |item_and_subtotal|
      #@item_and_subtotal_by_item.each do |item, subtotal|
        #@last_item_subtotal = subtotal
      #end
    #end
    #if @total - @last_item_price > 0.0 THE WAY IT WORKED BEFORE
    #if @item_and_subtotal_by_item.length > 0  
      #return @total -= @last_item_subtotal
    #else
      #@total = 0.0
    #end
  end

end

#employee_discount = CashRegister.new(20)
#employee_discount.total = 800
#p employee_discount