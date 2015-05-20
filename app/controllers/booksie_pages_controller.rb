class BooksiePagesController < ApplicationController
	def index
		@booksie_page = current_user.booksie_pages.all
	end

	def show
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
