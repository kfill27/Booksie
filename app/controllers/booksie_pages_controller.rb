class BooksiePagesController < ApplicationController
	def index
		@booksie_pages = current_user.booksie_pages
	end

  def dashboard
  # will show my personal booksie, the def show will show a booksie
    @booksie_page = current_user.check_if_owner(params[:id])
    # @booskie_page = BooksiePage.where(BooksiePage.find(params[:id]).owner.id == current_user.id)
    # if BooksiePage.find(params[:id]).owner.id == current_user.id
    #   @booksie_page = BooksiePage.find(params[:id])
    # end
    # @booksie_page = params[:id] ? BooksiePage.find(params[:id]) : current_user.booksie_page
    @photos = @booksie_page.photos
    @videos = @booksie_page.videos
    @milestones = @booksie_page.milestones
    # @milestone = Milestone.new

    # render :show
  end

	def show
    # TODO REFACTOR
    @booksie_page = params[:id] ? BooksiePage.find(params[:id]) : current_user.booksie_page
    # @booksie_page = Booksie.find(params[:id])
    @photos = @booksie_page.photos
    @videos = @booksie_page.videos
    @milestones = @booksie_page.milestones
    @milestone = Milestone.new
    # @booksie_page = current_user.check_if_owner(params[:id])
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
