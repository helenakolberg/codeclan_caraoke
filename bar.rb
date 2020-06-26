class Bar

    attr_reader :drinks, :tab
    
    def initialize(drinks, tab)
        @drinks = drinks
        @tab = tab
    end

    def drink_types_available
        return @drinks.length
    end

end