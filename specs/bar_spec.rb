require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../bar')
require_relative('../drink')
require_relative('../guest')

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

end