class CashRegister

    attr_accessor :discount, :total, :items, :last_item

    def initialize discount = 0, total = 0, items = [], last_item = []
        @discount = discount
        @total = total
        @items = items
        @last_item = last_item
    end

    def add_item title, price, quantity = 0

        self.last_item = []

        quantity > 0 ? 
        (self.total += price*quantity; i = quantity; until i == 0 do self.items.append(title); i -= 1 end; 
        self.last_item.append(title, quantity, (price * quantity)))
        :
        (self.total += price; self.items.append(title);
        self.last_item.append(title, quantity, price))

    end

    def apply_discount 
        if self.discount > 0
            self.total -= (self.total * discount/100)
            return "After the discount, the total comes to $#{self.total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_item[-1]
        i = self.last_item[1]
        until i == 0 do
            items.delete(self.last_item[0])
            i -= 1
        end
    end
end