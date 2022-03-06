class MoviesController < ApplicationController

    def show
      id = params[:id] # retrieve movie ID from URI route
      @movie = Movie.find(id) # look up movie by unique ID
      # will render app/views/movies/show.<extension> by default
    end

    def list
      items_per_page - 10
      @movie = Movie.find(params[:id])
      sort = case params[:id [release_date]]
      when "title" then "title" 
      
      when "release_date" then "release_date" 
      
      when  "title_reverse" then "name DESC" 
                
      when "release_date_reverse" then "name DESC" 
                  
      end
                

      conditions =["title LIKE?", "%#{params[:id]}%"] unless params[:id].nil
      @total = movies.count(:conditions=>conditions)
      @items_pages,@movie = paginate: items, order = sort, conditions =conditions,per_page = items_per_page
      if request.xml_http_request?
        render :partial =  "movies_list", layout = false
      end
    end
  
    def index
      @movies = Movie.all
      @movies = Movie.where(nil) # creates an anonymous scope
      @movies = @movies.filter_by_rating(params[:rating]) if params[:G].present?
      @movies = @movies.filter_by_rating(params[:rating]) if params[:PG].present?
      @movies = @movies.filter_by_rating(params[:rating]) if params[:PG-13].present?
      @movies = @movies.filter_by_rating(params[:rating]) if params[:R].present?
    end
  
    def new
      # default: render 'new' template
    end
  
    def create
      @movie = Movie.create!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully created."
      redirect_to movies_path
    end
  
    def edit
      @movie = Movie.find params[:id]
    end
  
    def update
      @movie = Movie.find params[:id]
      @movie.update_attributes!(movie_params)
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    end
  
    def destroy
      @movie = Movie.find(params[:id])
      @movie.destroy
      flash[:notice] = "Movie '#{@movie.title}' deleted."
      redirect_to movies_path
    end
  
    private
    # Making "internal" methods private is not required, but is a common practice.
    # This helps make clear which methods respond to requests, and which ones do not.
    def movie_params
      params.require(:movie).permit(:title, :rating, :description, :release_date)
    end

end