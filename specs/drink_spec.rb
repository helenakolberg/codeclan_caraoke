require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../drink')

class TestDrink < Minitest::Test

    def setup()
        @drink = Drink.new("Cocktail", 8)
    end

    def test_type()
        assert_equal("Cocktail", @drink.type)
    end

    def test_price()
        assert_equal(8, @drink.price)
    end

end