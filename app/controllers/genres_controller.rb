class GenresController < ApplicationController
  before_action :set_genre, only: %i[edit update destroy]

  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = 'Genre created successfully'
      redirect_to genres_path
    else
      render :new
    end
  end

  def edit; end

  def update
    if @genre.update(genre_params)
      flash[:notice] = 'Genre updated successfully'
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    @genre.destroy
    flash[:notice] = 'Genre deleted successfully'
    redirect_to genres_path
  end

  private

  def set_genre
    @genre = Genre.find(params[:id])
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end