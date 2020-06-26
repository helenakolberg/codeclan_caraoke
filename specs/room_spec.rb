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

end