require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../room')
require_relative('../guest')
require_relative('../song')

class TestRoom < Minitest::Test

    def setup()
        @guest1 = Guest.new("Tomek")
        @guest2 = Guest.new("Alina")
        @guest3 = Guest.new("Rudy")
        @guest4 = Guest.new("Jane")
        @guest5 = Guest.new("James")
        @guest6 = Guest.new("Rebeka")
        @guest7 = Guest.new("Stephen")

        @song1 = Song.new("Ring Of Fire", "Johnny Cash")
        @song2 = Song.new("Take Me Home, Country Roads", "John Denver")
        @song3 = Song.new("I'm Gonna Be (500 Miles)", "The Proclaimers")
        @playlist = [@song1, @song2, @song3]


        @room = Room.new("Cool Vibes", @playlist, 6, 5)
    end

    def test_name()
        assert_equal("Cool Vibes", @room.name)
    end

    def test_playlist()
        assert_equal([@song1, @song2, @song3], @room.playlist())
    end

    def test_room_starts_empty()
        assert_equal(0, @room.guest_number())
    end

    def test_check_guests_in()
        @room.check_in(@guest1)
        @room.check_in(@guest2)
        @room.check_in(@guest3)
        assert_equal(3, @room.guest_number())
    end

    def test_check_guests_out()
        @room.check_in(@guest1)
        @room.check_in(@guest2)
        @room.check_in(@guest3)
        @room.check_out(@guest3)
        assert_equal(2, @room.guest_number())
    end

    def test_how_many_songs()
        assert_equal(3, @room.playlist_length())
    end

    def test_add_song_to_playlist()
        song4 = Song.new("A Thousand Miles", "Vanessa Carlton")
        @room.add_song(song4)
        assert_equal(4, @room.playlist_length())
    end

    def test_capacity()
        assert_equal(6, @room.capacity)
    end

    def test_guest_cannot_check_in_max_capacity()
        @room.check_in(@guest1)
        @room.check_in(@guest2)
        @room.check_in(@guest3)
        @room.check_in(@guest4)
        @room.check_in(@guest5)
        @room.check_in(@guest6)
        assert_equal(6, @room.guest_number())
        @room.check_in(@guest7)
        assert_equal("This room is currently full", @room.check_in(@guest7))
        assert_equal(6, @room.guest_number())
    end

    def test_fee()
        assert_equal(5, @room.fee)
    end

end