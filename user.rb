require_relative "booking"
require_relative "seat_manager"
require_relative "user_bookings"

class User
  include SeatManager
  include UserBookings

  def initialize(cinema, bookings, user_id)
    @cinema = cinema
    @bookings = bookings
    @user_id = user_id
  end

  def menu
    loop do
      puts "\n--- User Menu ---"
      puts "1. View Movies"
      puts "2. View Shows"
      puts "3. Book Tickets"
      puts "4. Show My Bookings"
      puts "5. Exit"
      print "Choose option: "
      choice = gets.chomp.to_i

      case choice
      when 1 then @cinema.list_movies
      when 2 then @cinema.list_shows
      when 3 then book_tickets
      when 4 then show_my_bookings(@bookings, @user_id)
      when 5 then break
      else
        puts "Invalid choice!"
      end 
    end
  end

  def book_tickets
    if @cinema.shows.empty?
      puts "No shows available!"
      return
    end

    puts "Select a show to book:"
    @cinema.list_shows
    print "Enter show number: "
    show_index = gets.chomp.to_i - 1
    show = @cinema.shows[show_index]

    puts "Available seats: #{available_seats(show, @bookings)}"
    print "Enter number of tickets: "
    tickets = gets.chomp.to_i

    if tickets > available_seats(show, @bookings)
      puts "Not enough seats available!"
      return
    end

    booking = Booking.new(show, tickets, @user_id)
    @bookings << booking
    booking.save_receipt
    puts "Booking confirmed! Receipt saved in receipts/booking_#{booking.id}.txt"
  end
end
