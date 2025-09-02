module Report
  def total_bookings(bookings)
    bookings.size
  end

  def total_income(bookings)
    bookings.sum(&:total_price)
  end
end