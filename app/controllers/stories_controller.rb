class StoriesController < ApplicationController
  before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
	before_action :set_story, only: [:show, :edit, :update, :destroy]
	before_action :set_univers
	before_action :correct_user
	
	respond_to :html, :xml, :json

  # GET /stories
  # GET /stories.json
  def index
    @stories = @univers.stories
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
  end

  # GET /stories/new
  def new
	  @story = @univers.stories.build
	  respond_with(@story) #??
  end

  # GET /stories/1/edit
  def edit
  end

  # POST /stories
  # POST /stories.json
  def create
    
	@story = @univers.stories.build(story_params)

    respond_to do |format|
      if @story.save
		  format.html { redirect_to univers_stories_path, notice: 'Story was successfully created.' }
        format.json { render :show, status: :created, location: @story }
      else
        format.html { render :new }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stories/1
  # PATCH/PUT /stories/1.json
  def update
    respond_to do |format|
      if @story.update(story_params)
        format.html { redirect_to univers_stories_path, notice: 'Story was successfully updated.' }
        format.json { render :show, status: :ok, location: @story }
      else
        format.html { render :edit }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @story.destroy
    respond_to do |format|
      format.html { redirect_to univers_stories_url, notice: 'Story was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_story
      @story = Story.find(params[:id])
    end
	
	

    # Never trust parameters from the scary internet, only allow the white list through.
    def story_params
		params.require(:story).permit(:name)
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
