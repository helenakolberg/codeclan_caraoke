class Room

    attr_reader :number, :guests, :playlist
    
    def initialize(number, guests, playlist)
        @number = number
        @guests = guests
        @playlist = playlist
    end

    def guest_number()
        return @guests.length
    end

end