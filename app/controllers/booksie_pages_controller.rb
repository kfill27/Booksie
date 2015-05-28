class BooksiePagesController < ApplicationController
	def index
		@booksie_pages = current_user.booksie_pages
	end

  def dashboard
  # will show my personal booksie, the def show will show a booksie
    render :show
  end

	def show
    @booksie_page = current_user.check_if_owner(params[:id])
    @photos = current_user.photos
    @videos = current_user.videos
    @milestones = current_user.milestones
    @milestone = Milestone.new
    # TODO REFACTOR
    @booksie_page = params[:id] ? BooksiePage.find(params[:id]) : current_user.booksie_pages.first
    # @booksie_page = current_user.check_if_owner(params[:id])
    @photos = current_user.photos
	end

	def new
		@booksie_page = current_user.booksie_pages.new
	end

	def edit
	end

	def create
		# @profile = current_user.profile.new(profile_params)
    @booksie_page = current_user.booksie_pages.new(booksie_page_params)
    @booksie_page.user = current_user
    respond_to do |format|
      if @booksie_page.save
        format.html { redirect_to @booksie_page, notice: 'Booksie was successfully created.' }
        format.json { render :show, status: :created, location: @booksie_page }
      else
        format.html { render :new }
        format.json { render json: @booksie_page.errors, status: :unprocessable_entity }
      end
    end
	end
end
