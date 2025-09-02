class Show
  attr_accessor :movie, :time

  def initialize(movie, time)
    @movie = movie
    @time = time
  end

  def to_s
    "#{@movie.title} | Time: #{@time}"
  end
end