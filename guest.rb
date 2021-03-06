class Guest

    attr_reader :name, :money, :favourite_song
    
    def initialize(name, money, favourite_song)
        @name = name
        @money = money
        @favourite_song = favourite_song
    end

    def remove_money(amount)
        @money -= amount
    end

    def favourite_song_played(room)
        return "THAT'S MY SONG!!!" if room.playlist.include?(@favourite_song)
    end

end