class ActorsController < ApplicationController
    before_action :set_movie
  before_action :set_actor, only: [:show, :update, :destroy]

  def index
    @actors = @movie.actors
    render json: @actors
  end

  def show
    render json: @actor
  end

  def create
    @actor = @movie.actors.new(actor_params)

    if @actor.save
      render json: @actor, status: :created
    else
      render json: @actor.errors, status: :unprocessable_entity
    end
  end

  def update
    if @actor.update(actor_params)
      render json: @actor
    else
      render json: @actor.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @actor.destroy
  end

  private

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  def set_actor
    @actor = @movie.actors.find(params[:id])
  end

  def actor_params
    params.permit(:name, :age)
  end
end
