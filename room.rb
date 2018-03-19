class Room

  attr_reader :name, :capacity
  attr_accessor :occupants, :playlist, :fee, :till


  def initialize(name, occupants, playlist, capacity, fee, till)
    @name = name
    @occupants = occupants
    @playlist = playlist
    @capacity = capacity
    @fee = fee
    @till = till
  end

  def guest_has_sufficient_funds?(guest)
    return guest.funds > @fee
  end

  def check_capacity
    return @occupants.length < @capacity
  end

  def check_in_guest(guest)
    if check_capacity && guest_has_sufficient_funds?(guest)
      @occupants << guest
      guest.funds -= @fee
      @till += @fee
    elsif !check_capacity
      "The room is full!"
    elsif !guest_has_sufficient_funds?(guest)
      "The guest doesn't have enough money!"
    else !@occupants.length < @capacity && guest_has_sufficient_funds?(guest)
      "The room is full and the guest can't afford it anyway"
    end
  end

  def check_out_guest(guest)
    @occupants.delete_if { |occupant| occupant == guest}
  end

  def add_song_to_playlist(song)
    @playlist << song
  end

  def remove_song_from_playlist(song)
    @playlist.delete_if { |song_in_playlist| song_in_playlist == song}
  end














end
