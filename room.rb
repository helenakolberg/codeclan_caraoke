class Room

    attr_reader :number, :guests, :playlist
    
    def initialize(number, guests, playlist)
        @number = number
        @guests = guests
        @playlist = playlist
    end

end