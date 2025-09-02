class Movie
  attr_accessor :title, :duration, :genre

  def initialize(title, duration, genre)
    @title = title
    @duration = duration
    @genre = genre
  end

  def to_s
    "#{@title} (#{@duration} mins, #{@genre})"
  end
end
