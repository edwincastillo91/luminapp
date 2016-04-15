class PagesController < ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  respond_to :html
	
	def home
		if user_signed_in?
		@universes = current_user.universes
	    @primary = @universes.find_by(primary: true)
		else
		end
	end

  def index
    @pages = Page.all
    respond_with(@pages)
  end

  def show
    respond_with(@page)
  end

  def new
    @page = Page.new
    respond_with(@page)
  end

  def edit
  end

  def create
    @page = Page.new(page_params)
    @page.save
    respond_with(@page)
  end

  def update
    @page.update(page_params)
    respond_with(@page)
  end

  def destroy
    @page.destroy
    respond_with(@page)
  end

  private
    def set_page
      @page = Page.find(params[:id])
    end

    def page_params
      params[:page]
    end
	
	
	def set_primary_univers
		Univers.where()
	end
	
end
