require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')
require_relative('../song')

class TestGuest < Minitest::Test

    def setup()
        @song = Song.new("Born This Way", "Lady Gaga")
        @guest = Guest.new("Jonathan", 100, @song)
    end

    def test_name()
        assert_equal("Jonathan", @guest.name)
    end

    def test_money()
        assert_equal(100, @guest.money)
    end

    def test_song()
        assert_equal(@song, @guest.favourite_song)
    end

    def test_remove_money()
        @guest.remove_money(30)
        assert_equal(70, @guest.money)
    end

end