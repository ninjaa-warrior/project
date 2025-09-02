class Booking
  @@id_counter = 1
  attr_accessor :id, :show, :tickets, :user_id

  def initialize(show, tickets, user_id)
    @id = @@id_counter
    @@id_counter += 1
    @show = show
    @tickets = tickets
    @user_id = user_id
  end

  def total_price
    tickets * 100   # ₹100 per ticket
  end

  def save_receipt
    Dir.mkdir("receipts") unless Dir.exist?("receipts")
    File.open("receipts/booking_#{id}.txt", "w") do |f|
      f.puts "RubyPlex Ticket Receipt"
      f.puts "============================"
      f.puts "Booking ID: #{@id}"
      f.puts "User ID: #{@user_id}"
      f.puts "Movie: #{@show.movie.title}"
      f.puts "Show Time: #{@show.time}"
      f.puts "Tickets: #{@tickets}"
      f.puts "Total Price: ₹#{total_price}"
      f.puts "============================"
      f.puts "Enjoy your movie!"
    end
  end
end
