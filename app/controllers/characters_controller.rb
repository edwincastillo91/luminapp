class CharactersController < ApplicationController
   before_action :require_user_signed_in, only: [:index,:show, :create, :destroy]
	before_action :set_character, only: [:show, :edit, :update, :destroy]
	before_action :set_univers
	before_action :correct_user

	
	
	
 respond_to :html, :xml, :json
  # GET /characters
  # GET /characters.json
  def index
	  @characters = @univers.characters
  end

  # GET /characters/1
  # GET /characters/1.json
  def show
  end

  # GET /characters/new
  def new
	  @character = @univers.characters.build
	  respond_with(@chapter) #??
  end

  # GET /characters/1/edit
  def edit
  end

  # POST /characters
  # POST /characters.json
  def create
	  @character = @univers.characters.build(character_params)
	  

    respond_to do |format|
      if @character.save
		  format.html { redirect_to univers_characters_path, notice: 'Character was successfully created.' }
        format.json { render :show, status: :created, location: @character }
      else
        format.html { render :new }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /characters/1
  # PATCH/PUT /characters/1.json
  def update
    respond_to do |format|
      if @character.update(character_params)
		  format.html { redirect_to univers_characters_path, notice: 'Character was successfully updated.' }
        format.json { render :show, status: :ok, location: @character }
      else
        format.html { render :edit }
        format.json { render json: @character.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.json
  def destroy
    @character.destroy
    respond_to do |format|
      format.html { redirect_to characters_url, notice: 'Character was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_character
      @character = Character.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def character_params
      params.require(:character).permit(:first_name, :last_name, :drive, :wound, :eyes_color, :hair_color, :height, :weight, :race, :sex, :genetic_modification, :social_class, :sexual_orientation, :genre)
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
