class DaysController < ApplicationController
	before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
	before_action :set_day, only: [:show, :edit, :update, :destroy]
	before_action :set_univers
	before_action :correct_user

 respond_to :html, :js, :xml, :json

  def index
	  
	  @days = @univers.days.all
    
  end

  def show  
	   respond_to do |format|
		format.html { redirect_to univers_days_url, notice: 'Day was successfully destroyed.' }
		format.js #show.js.erb  
     	format.json { head :no_content }
    end
  end

  def new
    @day = @univers.days.build
	  @days = @univers.days
	  
  end

  def edit
  @days = @univers.days
  end

  def create
    
	  @day = @univers.days.build(day_params)
	  
	  @day.human_day = @day.date.strftime("%A %B %d, %Y")
	  @days = @univers.days.order("created_at DESC")
	  respond_to do |format|
   		if @day.save
			format.html { redirect_to univers_places_path, notice: 'Place was successfully created.' }
			format.js #create.js.erb  
			format.json { render :show, status: :created, location: @day }
		else
			format.html { render :new }
			format.json { render json: @day.errors, status: :unprocessable_entity }
		end
	  end
  end

  def update
	  #in model before_save  @day.human_day = @day.date.strftime("%j, %A %B %d, %Y") 
	 respond_to do |format|
		 if @day.update(day_params)
			 format.html { redirect_to univers_days_path, notice: 'Day was successfully updated.' }
		  format.js #update.js.erb  
			 format.json { render :show, status: :ok, location: @day }
      else
        format.html { render :edit }
			 format.json { render json: @day.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @day.destroy
    respond_to do |format|
		format.html { redirect_to univers_days_url, notice: 'Days was successfully destroyed.' }
		format.js #destroy.js.erb  
      format.json { head :no_content }
    end
  end

  private
    def set_day
      @day = Day.find(params[:id])
    end

    def day_params
      params.require(:day).permit(:date, :human_day)
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
