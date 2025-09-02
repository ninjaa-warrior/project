require_relative "cinema"
require_relative "admin"
require_relative "user"

cinema = Cinema.new
bookings = []

loop do
  puts "\n=== RubyPlex Theatre System ==="
  puts "1. Admin"
  puts "2. User"
  puts "3. Exit"
  print "Choose option: "
  choice = gets.chomp.to_i

  case choice
  when 1
    Admin.new(cinema, bookings).menu
  when 2
    print "Enter your User ID: "
    user_id = gets.chomp
    User.new(cinema, bookings, user_id).menu
  when 3
    puts "Goodbye!"
    break
  else
    puts "Invalid choice!"
  end
end


#nav 