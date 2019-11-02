
class CashRegister

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @register = []
    end

    def discount
        @discount
    end

    def total=(current_total)
        @total = current_total
    end

    def total
        @total
    end

    def add_item (title, price, quantity = 1)
            @total += (price * quantity)
            @last_transaction = 0


        while quantity > 0 do
            @register << title
            @last_transaction = @last_transaction + price
            quantity -= 1
        end

        return @total
    end

    def apply_discount
        if @discount != nil

            @total -= ((@discount.to_f / 100) * @total).to_i
            "After the discount, the total comes to $#{@total}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @register
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end



