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

    def check_in(guest)
        @guests << guest
    end

    def check_out(guest)
        @guests.delete(guest)
    end

    def playlist_length()
        return @playlist.length
    end

end