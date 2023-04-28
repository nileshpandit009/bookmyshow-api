class MoviesController < ApplicationController
  # Basic CRUD
  def index
    render json: { data: Movie.all }
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save!
    render json: { data: @movie }
  rescue StandardError => e
    render json: { data: { error: e.message } }
  end

  def update
    @movie = Movie.find(movie_params[:id])
    @movie.update(movie_params)
    render json: { data: @movie.reload }
  end

  def destroy
    render json: { data: Movie.find(movie_params[:id]).destroy }
  end

  private

  def movie_params
    params.require(:movie).permit(%i[id title description duration language])
  end
end
