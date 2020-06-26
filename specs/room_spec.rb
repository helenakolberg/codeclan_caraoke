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
        @guests = [@guest1, @guest2, @guest3]

        @song1 = Song.new("Ring Of Fire", "Johnny Cash")
        @song2 = Song.new("Take Me Home, Country Roads", "John Denver")
        @song3 = Song.new("I'm Gonna Be (500 Miles)", "The Proclaimers")
        @playlist = [@song1, @song2, @song3]


        @room = Room.new(1, @guests, @playlist)
    end

    def test_number()
        assert_equal(1, @room.number)
    end

    def test_guests()
        assert_equal([@guest1, @guest2, @guest3], @room.guests)
    end

    def test_playlist()
        assert_equal([@song1, @song2, @song3], @room.playlist)
    end

    def test_how_many_guests()
        assert_equal(3, @room.guest_number)
    end

    def test_check_guests_in()
        guest4 = Guest.new("Jane")
        @room.check_in(guest4)
        assert_equal(4, @room.guest_number)
    end

    def test_check_guests_out()
        @room.check_out(@guest3)
        assert_equal(2, @room.guest_number)
    end

end