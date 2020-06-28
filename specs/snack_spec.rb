require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../snack')

class TestSnack < Minitest::Test

    def setup()
        @snack = Snack.new("Crisps", 2)
    end

    def test_type
        assert_equal("Crisps", @snack.type)
    end

    def test_price
        assert_equal(2, @snack.price)
    end

end