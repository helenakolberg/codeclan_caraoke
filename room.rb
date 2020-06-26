class Room

    attr_reader :name, :guests, :playlist
    
    def initialize(name, guests, playlist)
        @name = name
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