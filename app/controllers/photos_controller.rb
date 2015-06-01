class PhotosController < ApplicationController
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  # GET /photos
  # GET /photos.json
  def index
    if params[:tag]
      @booksie_page = BooksiePage.find(params[:booksie_page_id])
      @photos = @booksie_page.photos.tagged_with(params[:tag])
      @videos = @booksie_page.videos.tagged_with(params[:tag])
      @milestones = @booksie_page.milestones.tagged_with(params[:tag])
      @video = Video.new
      @milestone = Milestone.new
    else
      @photos = Photo.all
      @comment = Comment.new
    end

  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])
    @commentable = @photo
    @comments = @commentable.comments
    @comment = Comment.new

    if params[:tag]
      @photos = Photo.tagged_with(params[:tag])
    else
      @photos = Photo.all
      @comment = Comment.new
    end

  end

  # GET /photos/new
  def new
    @photo = Photo.new

    # @users_array = []
    # BooksiePage.users
    # current_user.booksie_page_id
    # @booksie = BooksiePage.find(1)
  end

  # GET /photos/1/edit
  def edit
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(photo_params)
    # @photo.booksie_page = current_user.booksie_page #||=

    respond_to do |format|
      if @photo.save
        format.html { redirect_to :back, notice: 'Photo was successfully uploaded.' }
        format.json { render :show, status: :created, location: @photo }
      else
        format.html { redirect_to :back, notice: 'Oops, you forgot to add a photo.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /photos/1
  # PATCH/PUT /photos/1.json
  def update
    respond_to do |format|
      if @photo.update(photo_params)
        format.html { redirect_to @photo, notice: 'Photo was successfully updated.' }
        format.json { render :show, status: :ok, location: @photo }
      else
        format.html { render :edit }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo.destroy
    respond_to do |format|
      format.html { redirect_to :back, notice: 'Photo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_photo
      @photo = Photo.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def photo_params
      # added date
      params.require(:photo).permit(:date, :image, :booksie_page_id, :tag_list, :caption)
    end
end
