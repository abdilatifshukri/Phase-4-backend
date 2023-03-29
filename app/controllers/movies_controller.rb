class MoviesController < ApplicationController

    def index
        movies = Movie.all.includes(:actors, :directors)
        render json: movies.to_json(include: [:actors, :directors])
     end
    
      def show
        movie = Movie.find(params[:id])
        render json: movie.to_json(include: [:actors, :directors])
      end
    
      def create
        movie_params = params.require(:movie).permit(:name, :description, :year)
        actor_params = params.require(:actors).map { |a| a.permit(:name, :age) }
        director_params = params.require(:directors).map { |d| d.permit(:name, :age) }
      
        movie = Movie.new(movie_params)
        if movie.save
          # create actors
          actor_params.each do |actor_param|
            actor = Actor.new(actor_param.merge(movie: movie))
            actor.save
          end
      
          # create directors
          director_params.each do |director_param|
            director = Director.new(director_param.merge(movie: movie))
            director.save
          end
      
          render json: movie.to_json(include: [:actors, :directors]), status: :created
        else
          render json: { errors: movie.errors.full_messages }, status: :unprocessable_entity
        end
      end
      
       

      def destroy
        movie = Movie.find(params[:id])
        movie.destroy
        render json: { message: 'Movie deleted successfully' }, status: :ok
      end

      
      private
    
      def movie_params
        params.require(:movie).permit(:name, :description, :year, actors: [:name, :age], directors: [:name, :age])
      end
      
      

end
