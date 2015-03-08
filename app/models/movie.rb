class Movie < ActiveRecord::Base
  
  def after_initialize(title, rating, description, release_date, poster_path)
    @title = title
    @rating = rating
    @description = description
    @release_date = release_date
    @poster_path = poster_path
  end
  class Movie::InvalidKeyError < StandardError ; end
 
#  def self.api_key
#    '86d4d93bcac605d8ecffc0bf178e8b6a'
#  end
 
  def self.find_in_tmdb(string)
 #   Tmdb.default_language = 'pt'
 #   Tmdb.api_key = self.api_key
    begin
      TmdbMovie.find(:title => string, :limit => 2)
    rescue ArgumentError => tmdb_error
      raise Movie::InvalidKeyError, tmdb_error.message
    rescue RuntimeError => tmdb_error
      if tmdb_error.message =~ /status code '404'/
        raise Movie::InvalidKeyError, tmdb_error.message
      else
        raise RuntimeError, tmdb_error.message
      end
    end      
  end

  attr_accessible :title, :rating, :description, :release_date


end
