class BooksiePagesController < ApplicationController
  # before_action :set_booksie_page, only: [:show]

	def index
		@booksie_page = current_user.booksie_pages.all
	end

	def show
    @abilities = current_user.abilities.find_by_role("admin")
    @booksie_page = current_user.booksie_pages.find_by_id(@abilities.booksie_page_id)
    @photo = @booksie_page.photos.create(booksie_page_id: @abilities.booksie_page_id)
	end

	def new
		@booksie_page = current_user.booksie_pages.new
	end

  def make_photo
    @photo = @booksie_page.photos.new(photo_params)
  end

	def create
    @booksie_page = current_user.booksie_pages.new
    # @booksie_page.user = current_user
    respond_to do |format|
      if @booksie_page.save
        format.html { redirect_to root_path, notice: 'Booksie was successfully created.' }
        format.json { render :show, status: :created, location: @booksie_page }
      else
        format.html { render :new }
        format.json { render json: @booksie_page.errors, status: :unprocessable_entity }
      end
    end
	end


  private

  # def set_booksie_page
  #   @booksie_page = BooksiePage.find(params[:id])
  # end


  def photo_params
    params.require(:photo).permit(:caption, :image)
  end

end
