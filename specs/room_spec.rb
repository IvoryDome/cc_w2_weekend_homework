require('minitest/autorun')
require_relative('../room.rb')
require_relative('../song.rb')
require_relative('../guest.rb')

class TestRoom < MiniTest::Test

  def setup
    @occupants = [
      @guest1 = Guest.new("Larry", 70),
      @guest2 = Guest.new("Jerry", 85),
      @guest3 = Guest.new("George", 40),
      @guest4 = Guest.new("Kramer", 100),
      @guest5 = Guest.new("Newman", 65)
    ]
    @guest6 = Guest.new("Bob Sacamano", 50)
    @playlist = [
      @song1 = Song.new("Bohemian Rhapsody", "Queen"),
      @song2 = Song.new("Rapper's Delight", "Sugar Hill Gang"),
      @song3 = Song.new("Never gonna give you up", "Rick Astley"),
      @song4 = Song.new("Skeng", "The Bug"),
      @song5 = Song.new("Down Under", "Men At Work")
    ]
    @song6 = Song.new("500 miles", "The Proclaimers")
    @room1 = Room.new(5, @occupants, @playlist, 6, 5, 100)
  end

  def test_room_getters
    assert_equal(5, @room1.name)
    assert_equal(@occupants, @room1.occupants)
    assert_equal(@playlist, @room1.playlist)
    assert_equal(5, @room1.fee)
    assert_equal(100, @room1.till)
  end

  def test_check_in_guest__fee_payment
    @room1.check_in_guest(@guest6)
    occupants_after_check_in = @room1.occupants << @guest6
    assert_equal(occupants_after_check_in, @room1.occupants)
    assert_equal(45, @guest6.funds)
  end

  def test_check_out_guest
    @room1.check_out_guest(@guest3)
    occupants_after_check_out = [@guest1, @guest2, @guest4, @guest5]
    assert_equal(occupants_after_check_out, @room1.occupants)
  end

  def test_add_song_to_playlist
    @room1.add_song_to_playlist(@song6)
    playlist_after_new_song = @room1.playlist << @song6
    assert_equal(playlist_after_new_song, @room1.playlist)
  end

  def test_remove_song_from_playlist
    @room1.remove_song_from_playlist(@song4)
    playlist_after_song_removed = [@song1, @song2, @song3, @song5]
    assert_equal(playlist_after_song_removed, @room1.playlist)
  end

  def test_capacity__max
    guest7 = Guest.new("Art Vandelay", 100)
    @room1.check_in_guest(@guest6)
    result = @room1.check_in_guest(guest7)
    assert_equal("The room is full!", result)
  end

  def test_insufficient_funds
    guest8 = Guest.new("Boxcar Willie", 4)
    result = @room1.check_in_guest(guest8)
    assert_equal("The guest doesn't have enough money!", result)
  end

  def test_room_till_takes_fee
    @room1.check_in_guest(@guest6)
    assert_equal(105, @room1.till)
  end

end
