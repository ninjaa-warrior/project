require_relative "cinema"
require_relative "report"
require_relative "seat_manager"

class Admin
  include Report
  include SeatManager

  def initialize(cinema, bookings)
    @cinema = cinema
    @bookings = bookings
  end

  def menu
    loop do
      puts "\n--- Admin Menu ---"
      puts "1. Add Movie"
      puts "2. Add Show"
      puts "3. View Movies"
      puts "4. View Shows"
      puts "5. View Total Bookings"
      puts "6. View Total Income"
      puts "7. Check Available Seats for Show"
      puts "8. Exit"
      print "Choose option: "
      choice = gets.chomp.to_i

      case choice
      when 1 then add_movie
      when 2 then add_show
      when 3 then @cinema.list_movies
      when 4 then @cinema.list_shows
      when 5 then puts "Total Bookings: #{total_bookings(@bookings)}"
      when 6 then puts "Total Income: ₹#{total_income(@bookings)}"
      when 7 then check_seats
      when 8 then break
      else
        puts "Invalid choice!"
      end
    end
  end

  def add_movie
    print "Enter movie title: "
    title = gets.chomp
    print "Enter duration (mins): "
    duration = gets.chomp.to_i
    print "Enter genre: "
    genre = gets.chomp

    movie = Movie.new(title, duration, genre)
    @cinema.add_movie(movie)
    puts "Movie added!"
  end

  def add_show
    if @cinema.movies.empty?
      puts "No movies available. Add a movie first!"
      return
    end

    puts "Select a movie for the show:"
    @cinema.list_movies
    print "Enter movie number: "
    movie_index = gets.chomp.to_i - 1
    movie = @cinema.movies[movie_index]

    print "Enter show time (e.g. 18:00): "
    time = gets.chomp

    show = Show.new(movie, time)
    @cinema.add_show(show)
    puts "Show added!"
  end

  def check_seats
    if @cinema.shows.empty?
      puts "No shows available!"
      return
    end
    puts "Select a show:"
    @cinema.list_shows
    print "Enter show number: "
    show_index = gets.chomp.to_i - 1
    show = @cinema.shows[show_index]

    puts "Available seats: #{available_seats(show, @bookings)}"
  end
end
