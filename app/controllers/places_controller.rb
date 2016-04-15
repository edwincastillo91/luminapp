class PlacesController < ApplicationController
   before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
	before_action :set_place, only: [:show, :edit, :update, :destroy]
	before_action :set_univers
	before_action :correct_user
	before_action :pull_countries, only: [:new, :edit, :index]
	
	
	respond_to :html, :xml, :json

  # GET /places
  # GET /places.json
  def index
	  @places = @univers.places
  end

  # GET /places/1
  # GET /places/1.json
  def show
  end


	
  # GET /places/new
  def new
	  @place = @univers.places.build
	  
  end

	def pull_countries #pull used country in specific univers
		@newarray = Array.new
		@cities = Array.new
		@country_name_array = Array.new
		places = @univers.places.all
		places.each do |place|
			@newarray << place.country
			@country_name_array << place.country_name
			@cities << place.city 
		end
	
		
		@top_countries =  @newarray.uniq
		@top_countries_name = @country_name_array.uniq
		@cities = @cities.compact.uniq
	end
	
	

	
	
	

  # GET /places/1/edit
  def edit
  end

  # POST /places
  # POST /places.json
  def create
	  @place = @univers.places.build(place_params)
	  

    respond_to do |format|
      if @place.save
		format.html { redirect_to univers_places_path, notice: 'Place was successfully created.' }
		format.js #create.js.erb  
        format.json { render :show, status: :created, location: @place }
      else
        format.html { render :new }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /places/1
  # PATCH/PUT /places/1.json
  def update
    respond_to do |format|
      if @place.update(place_params)
		  format.html { redirect_to univers_places_path, notice: 'Place was successfully updated.' }
        format.json { render :show, status: :ok, location: @place }
      else
        format.html { render :edit }
        format.json { render json: @place.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.json
  def destroy
    @place.destroy
    respond_to do |format|
		format.html { redirect_to univers_places_url, notice: 'Place was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_place
      @place = Place.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def place_params
      params.require(:place).permit(:name,:city, :country, :subdivision, :latitude, :longitude)
    end
	
	
	
	def set_univers
		@univers = Univers.find(params[:univers_id])
    end
	
	# Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to root_path
      end
    end
	
	
	
	#check if current user is the creator of the univers
	def correct_user
		unless current_user == @univers.user
			flash[:danger] = "You have no power there"
			redirect_to universes_path
      end
    end
	
end
