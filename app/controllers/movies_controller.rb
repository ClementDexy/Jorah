class MoviesController < ApplicationController
    def index
    @movies = Movie.all 
  end

  def edit
    @movies = Movie.all 
  end

  def new
    @movies = Movie.new
  end

  def create
    @movies = Movie.new(movie_params) 
    if @movies.save   
      redirect_to movies_path, notice: "Successfully uploaded."   
   else   
      render "new"   
   end   
  end
  def show
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Studentt was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @studentt.movie, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @movies= Movie.find(params[:id])   
      @movies.destroy   
      redirect_to movies_path, notice:  "Successfully deleted."   
   end   
      
   private   
      def movie_params   
      params.require(:movie).permit(:title, :category, :year, :price, :attachment)   
   end   

  
end

