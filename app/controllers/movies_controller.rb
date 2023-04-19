class MoviesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  before_action :set_movie, only: %i[show edit show update destroy]
  before_action :validate_post_owner, only: %i[edit update destroy]
  before_action :set_movie_page, only: :update

  def index
    @movies = Movie.includes(:genres).page(params[:page]).per(10)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user = current_user
    @movie.short_url = generate_short_url
    
    if @movie.save
      redirect_to movies_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  def edit; end

  def update
    if @movie.update(movie_params)
      redirect_to movies_path(page: @movie_page)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def short_url
    @movie = Movie.find_by(short_url: params[:short_url])
    render "movies/show"
  end

  def destroy
    @movie.destroy
    redirect_to movies_path
  end

  private

  def validate_post_owner
    unless @movie.user == current_user
      flash[:notice] = "the movie doesn't belong to you"
      redirect_to movies_path
    end
  end

  def set_movie
    @movie = Movie.find(params[:id] || params[:short_url])
  end

  def set_movie_page
    page = 0
    loop do
      page += 1
      movies = Movie.page(page).per(10)
      break if movies.select { |m| m[:id] == @movie.id }.count == 1
    end
    @movie_page = page
  end

  def movie_params
    params.require(:movie).permit(:title, :blurb, :country, :release_date, :showing_start, :showing_end, genre_ids: [])
  end

  def generate_short_url
    alphanum = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'
    short_url = ''
    loop do
      7.times { short_url += alphanum.split('')[rand(0...62)] }
      break if Movie.unscoped.where(short_url: short_url).empty?

      short_url = ''
    end
    short_url
  end
end
