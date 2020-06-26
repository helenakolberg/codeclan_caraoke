require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')
require_relative('../room')

class TestGuest < Minitest::Test

    def setup()
        @song1 = Song.new("Born This Way", "Lady Gaga")
        @song2 = Song.new("Take Me Home, Country Roads", "John Denver")
        @song3 = Song.new("I'm Gonna Be (500 Miles)", "The Proclaimers")

        @guest1 = Guest.new("Jonathan", 100, @song1)
        @guest2 = Guest.new("Jim", 90, @song3)

        @room = Room.new("Chill Room", [@song1, @song2], 6, 5)
    end

    def test_name()
        assert_equal("Jonathan", @guest1.name)
    end

    def test_money()
        assert_equal(100, @guest1.money)
    end

    def test_song()
        assert_equal(@song1, @guest1.favourite_song)
    end

    def test_remove_money()
        @guest1.remove_money(30)
        assert_equal(70, @guest1.money)
    end

    def test_favourite_song_played()
        assert_equal("THAT'S MY SONG!!!", @guest1.favourite_song_played(@room))
    end

    def test_favourite_song_not_played()
        assert_nil(@guest2.favourite_song_played(@room))
    end

end