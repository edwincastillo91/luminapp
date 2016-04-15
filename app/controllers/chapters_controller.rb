class ChaptersController < ApplicationController
   before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
	before_action :set_chapter, only: [:show, :edit, :update, :destroy]
	before_action :set_univers
	before_action :correct_user

  respond_to :html, :xml, :json

  def index
	  @chapters = @univers.chapters.all
    respond_with(@chapters)
  end

  def show
    respond_with(@chapter)
  end

  def new
	  @chapter = @univers.chapters.build
	  respond_with(@chapter)
  end

  def edit
  end

  def create
    @chapter = @univers.chapters.build(chapter_params)
    @chapter.save
	  respond_with(@univers, @chapter)
  end

  def update
    @chapter.update(chapter_params)
    respond_with(@univers, @chapter)
  end

  def destroy
    @chapter.destroy
    respond_with(@chapter)
  end

  private
    def set_chapter
      @chapter = Chapter.find(params[:id])
    end

    def chapter_params
      params[:chapter]
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
