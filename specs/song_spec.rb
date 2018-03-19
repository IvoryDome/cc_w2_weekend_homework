require('minitest/autorun')
require_relative('../song.rb')

class TestSong < MiniTest::Test

  def setup
      @song1 = Song.new("Bohemian Rhapsody", "Queen")
  end

  def test_song_getters
    assert_equal("Bohemian Rhapsody", @song1.title)
    assert_equal("Queen", @song1.artist)
  end













end
