class Room

    attr_reader :name, :playlist, :guests, :capacity
    
    def initialize(name, playlist)
        @name = name
        @playlist = playlist
        @guests = []
        @capacity = 6
    end

    def guest_number()
        return @guests.length
    end

    def check_in(guest)
        @guests << guest if (guest_number < @capacity)
        return "This room is currently full"
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