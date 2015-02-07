# This file is app/controllers/movies_controller.rb
class MoviesController < ApplicationController
  def index
# @movies = Movie.all
 @movies = Movie.find(:all, :order => 'title')
#  @movies = Movie.all.sort_by {|item| item.title}
  end

  def show
  id = params[:id] # retrieve movie ID from URI route
  @movie = Movie.find(id) # look up movie by unique IDi
  rescue ActiveRecord::RecordNotFound
    flash[:notice] = "Movie ID ##{id} not found!"
    redirect_to :action => 'index' #movies_path
  # will render app/views/movies/show.html.haml by default
end

def new
# default: render 'new' template
end

def create
  #debugger
  @movie= Movie.create!(params[:movie])
  flash[:notice] = "#{@movie.title} was successfully created!"
  redirect_to movies_path
end

def edit
  @movie = Movie.find params[:id]
end

def update
  @movie = Movie.find params[:id]
  @movie.update_attributes!(params[:movie])
  flash[:notice] = "#{@movie.title} was successfully updated!"
  redirect_to movie_path(@movie)

end

def destroy
  @movie = Movie.find params[:id]
  @movie.destroy
  flash[:notice] = "#{@movie.title} was successfully deleted!"
  redirect_to movies_path

end

end
