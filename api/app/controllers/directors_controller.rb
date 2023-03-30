class DirectorsController < ApplicationController

    def index
        directors = Director.all
        render json: directors
      end
    
      def show
        director = Director.find(params[:id])
        render json: director
      end
    
      def create
        director = Director.new(director_params)
        if director.save
          render json: director, status: :created
        else
          render json: { errors: director.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def director_params
        params.require(:director).permit(:name, :age, :movie_id)
      end
      
end
