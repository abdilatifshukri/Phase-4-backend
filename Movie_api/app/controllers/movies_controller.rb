class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :update, :destroy]

  def index
    @movies = Movie.all
    render json: @movies, include: [:actors, :diractors, :reviews]
  end

  def show
    render json: @movie, include: [:actors, :diractors, :reviews]
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      render json: @movie, status: :created, include: [:actors, :diractors, :reviews]
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def update
    if @movie.update(movie_params)
      render json: @movie, include: [:actors, :diractors, :reviews]
    else
      render json: @movie.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
  end

  private

  def set_movie
    @movie = Movie.find(params[:id])
  end

  def movie_params
    params.permit(:name, :description, :image, :user_id, 
      actors: [:name, :age], 
      diractors: [:name, :age], 
      reviews: [:title, :comment])
  end
end
