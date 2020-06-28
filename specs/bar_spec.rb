require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar')
require_relative('../drink')
require_relative('../snack')
require_relative('../guest')
require_relative('../song')
require_relative('../room')

class TestBar < Minitest::Test

    def setup()
        @drink1 = Drink.new("Cocktail", 8)
        @drink2 = Drink.new("Wine", 5)
        @drink3 = Drink.new("Pint", 4)
        @drinks = [@drink1, @drink2, @drink3]

        @snack1 = Snack.new("Crisps", 2)
        @snack2 = Snack.new("Nuts", 3)
        @snack3 = Snack.new("Fries", 4)
        @snacks = [@snack1, @snack2, @snack3]
        
        @bar = Bar.new(@drinks, @snacks, 100)

    end

    def test_drinks
        assert_equal(3, @bar.number_of_drink_types_available)
    end

    def test_tab
        assert_equal(100, @bar.tab)
    end

    def test_charge_guest_entry_fee
        song = Song.new("Y.M.C.A.", "Village People")
        guest = Guest.new("Jane", 200, song)
        room = Room.new("Mega Hits", [song], 6, 5)
        @bar.charge_guest_enry_fee(guest, room)
        assert_equal(195, guest.money)
        assert_equal(105, @bar.tab)
    end

    def test_sell_guest_drink
        song = Song.new("Respect", "Aretha Franklin")
        guest = Guest.new("Ruben", 50, song)
        @bar.sell_guest_drink(guest, @drink1)
        assert_equal(42, guest.money)
        assert_equal(108, @bar.tab)
    end

    def test_sell_guest_snack
        song = Song.new("Dancing Queen", "ABBA")
        guest = Guest.new("James", 110, song)
        @bar.sell_guest_snack(guest, @snack1)
        assert_equal(108, guest.money)
        assert_equal(102, @bar.tab)
    end

end