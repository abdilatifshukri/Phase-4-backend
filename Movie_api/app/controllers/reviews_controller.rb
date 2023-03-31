class ReviewsController < ApplicationController
    before_action :set_movie
    before_action :set_review, only: [:show, :update, :destroy]
  
    def index
      @reviews = @movie.reviews
      render json: @reviews
    end
  
    def show
      render json: @review
    end
  
    def create
      @review = @movie.reviews.new(review_params)
  
      if @review.save
        render json: @review, status: :created
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  
    def update
      if @review.update(review_params)
        render json: @review
      else
        render json: @review.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @review.destroy
    end
  
    private
  
    def set_movie
      @movie = Movie.find(params[:movie_id])
    end
  
    def set_review
      @review = @movie.reviews.find(params[:id])
    end
  
    def review_params
      params.permit(:title, :comment)
    end
end
