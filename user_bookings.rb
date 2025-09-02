module UserBookings
  def show_my_bookings(bookings, user_id)
    user_bookings = bookings.select { |b| b.user_id == user_id }

    if user_bookings.empty?
      puts "There are no bookings yet."
    else
      puts "\n--- My Bookings ---"
      user_bookings.each do |b|
        puts "Booking ##{b.id}: #{b.show.movie.title} at #{b.show.time}, Tickets: #{b.tickets}, Total: ₹#{b.total_price}"
      end
    end
  end
end
 