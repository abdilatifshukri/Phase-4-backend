class DiractorsController < ApplicationController
    before_action :set_movie
    before_action :set_diractor, only: [:show, :update, :destroy]
  
    def index
      @diractors = @movie.diractors
      render json: @diractors
    end
  
    def show
      render json: @diractor
    end
  
    def create
      @diractor = @movie.diractors.new(diractor_params)
  
      if @diractor.save
        render json: @diractor, status: :created
      else
        render json: @diractor.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @diractor.update(diractor_params)
        render json: @diractor
      else
        render json: @diractor.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @diractor.destroy
    end
  
    private
  
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
  
    def set_diractor
      @diractor = @movie.diractors.find(params[:id])
    end
  
    def diractor_params
      params.permit(:name, :age)
    end
  end
