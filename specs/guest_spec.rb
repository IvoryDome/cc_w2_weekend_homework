require('minitest/autorun')
require_relative('../guest.rb')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Larry")
  end


  def test_guest_getters
    result = @guest1.name
    assert_equal("Larry", result)
  end
















end
