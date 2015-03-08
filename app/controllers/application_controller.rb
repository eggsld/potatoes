class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'themoviedb'

  before_filter :set_config
  Tmdb::Api.key("86d4d93bcac605d8ecffc0bf178e8b6a")

  def set_config
    @configuration = Tmdb::Configuration.new
  end

end
