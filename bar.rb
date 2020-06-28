class Bar

    attr_reader :drinks, :snacks, :tab
    
    def initialize(drinks, snacks, tab)
        @drinks = drinks
        @snacks = snacks
        @tab = tab
    end

    def number_of_drink_types_available()
        return @drinks.length
    end

    def charge_guest_enry_fee(guest, room)
        guest.remove_money(room.fee)
        @tab += room.fee
    end

    def sell_guest_drink(guest, drink)
        guest.remove_money(drink.price)
        @tab += drink.price
    end

    def sell_guest_snack(guest, snack)
        guest.remove_money(snack.price)
        @tab += snack.price
    end

end