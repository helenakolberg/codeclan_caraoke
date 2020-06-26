require('minitest/autorun')
require('minitest/reporters')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

require_relative('../song')

class TestSong < Minitest::Test

    def setup()
        song = Song.new("Shake It Off", "Taylor Swift")
    end

end