class ActorsController < ApplicationController

    def index
        actors = Actor.all
        render json: actors
      end
    
      def show
        actor = Actor.find(params[:id])
        render json: actor
      end
    
      def create
        actor = Actor.new(actor_params)
        if actor.save
          render json: actor, status: :created
        else
          render json: { errors: actor.errors.full_messages }, status: :unprocessable_entity
        end
      end
    
      private
    
      def actor_params
        params.require(:actor).permit(:name, :age, :movie_id)
      end
      
end
