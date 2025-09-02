module SeatManager
  MAX_SEATS = 50   # each show has 50 seats

  def available_seats(show, bookings)
    booked = bookings.select { |b| b.show == show }.sum(&:tickets)
    MAX_SEATS - booked
  end
end
 



#ansh