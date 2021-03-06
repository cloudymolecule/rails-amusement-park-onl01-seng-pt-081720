class AttractionsController < ApplicationController
  before_action :set_attraction, only: [:show, :edit, :update, :destroy]

  
  def index
    @user = User.find_by(id: session[:user_id])
    @attractions = Attraction.all
  end

  
  def show
    @ride = Ride.new
    @user = User.find_by(id: session[:user_id])
  end


  def new
    @attraction = Attraction.new
  end

  
  def edit
    
  end

  
  def create
    @attraction = Attraction.new(attraction_params)
    if @attraction.save
      
      redirect_to attraction_path(@attraction)
    else
      render :new
    end
  end

 
  def update
    @attraction.update(attraction_params)
    redirect_to attraction_path(@attraction)
  end

  
  def destroy
    
  end

  private
    
    def set_attraction
      @attraction = Attraction.find(params[:id])
    end

    
    def attraction_params
      params.require(:attraction).permit(:id, :name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end

end
