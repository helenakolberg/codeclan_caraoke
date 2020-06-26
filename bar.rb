class Bar

    attr_reader :drinks, :tab
    
    def initialize(drinks, tab)
        @drinks = drinks
        @tab = tab
    end

    def drink_types_available()
        return @drinks.length
    end

    def charge_guest_enry_fee(guest, room)
        guest.remove_money(room.fee)
        @tab += room.fee
    end

end