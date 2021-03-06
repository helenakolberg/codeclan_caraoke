class Room

    attr_reader :name, :playlist, :guests, :capacity, :fee
    
    def initialize(name, playlist, capacity, fee)
        @name = name
        @playlist = playlist
        @guests = []
        @capacity = capacity
        @fee = fee
    end

    def guest_number()
        return @guests.length
    end

    def check_in(guest)
        if (guest_number < @capacity)
            @guests << guest
        else
            return "This room is currently full"
        end
    end

    def check_out(guest)
        @guests.delete(guest)
    end

    def playlist_length()
        return @playlist.length
    end

    def add_song(song)
        @playlist << song
    end


end