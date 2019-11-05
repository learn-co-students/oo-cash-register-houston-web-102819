class CashRegister

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @cart = []
    end
    
    # def cart 
    #     return @cart
    # end
     
    def discount
        return @discount
    end

    def discount=(value)
        @discount = value
    end

    def total
        return @total
    end

    def total=(value)
        @total = value
    end

    def add_item(title, price, quantity=0)
        @cart.push(title)
        if quantity != 0
            @total += (price * quantity)
        else
            @total += price
        end

        while quantity > 1
            @cart.push(title)
            quantity -= 1
        end

    return @total
    end


    def apply_discount
        if @discount != nil
            @total -= @total * (@discount.to_f / 100)
            "After the discount, the total comes to $#{@total.to_i}." 
        else
            "There is no discount to apply."
        end

    end

    def items
        @cart
    end

    def void_last_transaction
        new_array = @cart.pop
        return @cart
    end

end


