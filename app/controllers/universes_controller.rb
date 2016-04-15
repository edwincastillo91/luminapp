class UniversesController < ApplicationController
	before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
  before_action :set_univers, only: [:show, :edit, :update, :destroy]
	before_action :correct_user, only: [:show, :edit, :update, :destroy]

	

  respond_to :html

  def index
	  
	  @universes = current_user.universes
    respond_with(@universes)

  end

  def show
    respond_with(@univers)
  end

  def new
    @univers = Univers.new
    respond_with(@univers)
  end

  def edit
  end

  def create
    @univers = current_user.universes.build(univers_params)
    @univers.save
    respond_with(@univers)
  end

  def update
    @univers.update(univers_params)
    respond_with(@univers)
  end

  def destroy
    @univers.destroy
    respond_with(@univers)
  end

  private
    def set_univers
      @univers = Univers.find(params[:id])
    end

    def univers_params
      params.require(:univers).permit(:name, :primary)
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
