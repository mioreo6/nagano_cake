  class Admin::GenresController < ApplicationController
  def index
    @genres = Genre.all
  end


  def create
   @genre = Genre.new(genre_params)
   @genre.save
   redirect_to '/admin/genre'
  end

  def update
    genre = Genre(params[:id])
    genre.update(genre_params)
    redirect_to '/admin/genre'
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  private
  def genre_params
   params.require(:genre).permit(:name)
  end
  end

