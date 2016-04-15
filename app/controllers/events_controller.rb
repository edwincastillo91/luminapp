class EventsController < ApplicationController
    before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :set_univers
	before_action :correct_user
	
	
		respond_to :html, :xml, :json

  # GET /events
  # GET /events.json
  def index
	  @events = @univers.events
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
	  
	  
	  
	  #get univers_id
	  #get place_id
	  #get new event
	  
#	  @place = @univers.places.build
#	  @event = @place.events.build
	  
	  
	  @dates = @univers.days.all
	  @places = @univers.places.all
	  
	  
	  @event = @univers.events.build

	  
	 
	  respond_with(@univers, @event)
  end

  # GET /events/1/edit
  def edit
	  @places = @univers.places.all
	  @dates = @univers.days.all 
  end

  # POST /events
  # POST /events.json
  def create
	  @place = @univers.places.build
	  @event = @univers.events.build(event_params)
	  
	  
	  respond_to do |format|
			if @event.save
			
			
		  
		  format.html { redirect_to univers_events_path, notice: 'Event was successfully created.' }
				format.json { render :show, status: :created, location: [@univers, @event] }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
			end
      
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
		  format.html { redirect_to univers_events_path, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: [@univers, @event] }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
		format.html { redirect_to univers_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
		params.require(:event).permit(:name, :place_id, :day_id)
    end
	
	
	def place_params
		params.require(:place).permit(:name)
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
