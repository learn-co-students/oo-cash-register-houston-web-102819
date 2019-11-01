class CashRegister

    def initialize(discount=nil)
        @total = 0
        @discount = discount
        @items_list = []
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


    def add_item(title, price, quantity=nil)
        if quantity
            @total += (price * quantity)
            quantity.times {@items_list.push(title)}
            @last_transaction = quantity * price
        else
            @total += price
            @items_list.push(title)
            @last_transaction = price
        end
    end

    def apply_discount
        if @discount
            @total = @total * (1 - (@discount.to_f/100))
            @total = @total.round
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @items_list
    end

    def void_last_transaction
        @total = @total - @last_transaction
    end

end
