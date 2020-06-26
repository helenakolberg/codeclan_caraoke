require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar')
require_relative('../drink')
require_relative('../guest')
require_relative('../song')
require_relative('../room')

class TestBar < Minitest::Test

    def setup()
        @drink1 = Drink.new("Cocktail", 8)
        @drink2 = Drink.new("Wine", 5)
        @drink3 = Drink.new("Pint", 4)
        @drinks = [@drink1, @drink2, @drink3]
        
        @bar = Bar.new(@drinks, 100)

    end

    def test_drinks
        assert_equal(3, @bar.drink_types_available)
    end

    def test_tab
        assert_equal(100, @bar.tab)
    end

    def test_charge_guest_entry_fee
        song = Song.new("Y.M.C.A.", "Village People")
        guest = Guest.new("Sam", 200, song)
        room = Room.new("Mega Hits", [song], 6, 5)
        @bar.charge_guest_enry_fee(guest, room)
        assert_equal(195, guest.money)
        assert_equal(105, @bar.tab)
    end

end