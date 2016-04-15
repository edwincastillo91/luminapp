class DaysController < ApplicationController
  before_action :set_day, only: [:show, :edit, :update, :destroy]
	 before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
	before_action :set_univers
	before_action :correct_user

  respond_to :html

  def index
	  
    @days = Day.all
    respond_with(@days)
  end

  def show
    respond_with(@day)
  end

  def new
    @day = @univers.days.build
	  
  end

  def edit
  end

  def create
    
	  @day = @univers.days.build(day_params)
	   @day.human_day = @day.date.strftime("%A %B %d, %Y")
   if @day.save
	  
	   redirect_to univers_days_path(@univers.id)
   else
	   render(new)
   end
  end

  def update
	  #in model before_save  @day.human_day = @day.date.strftime("%j, %A %B %d, %Y") 
	  @day.update(day_params)
	  
    redirect_to univers_days_path(@univers.id)
  end

  def destroy
    @day.destroy
    redirect_to univers_days_path(@univers.id)
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
