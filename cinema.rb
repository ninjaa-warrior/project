require_relative "movie"
require_relative "show"

class Cinema
  attr_accessor :movies, :shows

  def initialize
    @movies = []
    @shows = []
  end

  def add_movie(movie)
    @movies.push(movie)
  end

  def add_show(show)
    @shows.push(show)
  end

  def list_movies
    @movies.each_with_index do |movie, i|
      puts "#{i+1}. #{movie}"
    end
  end

  def list_shows
    @shows.each_with_index do |show, i|
      puts "#{i+1}. #{show}"
    end
  end
end



#ansh 