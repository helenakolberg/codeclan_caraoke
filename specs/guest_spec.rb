require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../guest')

class TestGuest < Minitest::Test

    def setup()
        @guest = Guest.new("Jonathan", 100)
    end

    def test_name()
        assert_equal("Jonathan", @guest.name)
    end

    def test_money()
        assert_equal(100, @guest.money)
    end

end