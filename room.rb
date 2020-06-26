class Room

    attr_reader :name, :playlist, :guests
    
    def initialize(name, playlist)
        @name = name
        @playlist = playlist
        @guests = []
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

    def add_song(song)
        @playlist << song
    end

end