class MilestonesController < ApplicationController
before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  # GET /milestone
  # GET /milestone.json
  def index
    @milestones = Milestone.all
  end

  # GET /milestone/1
  # GET /milestone/1.json
  def show
  end

  # GET /milestone/new
  def new
    @milestone = Milestone.new

    # @users_array = []
    # BooksiePage.users
    # current_user.booksie_page_id
    # @booksie = BooksiePage.find(1)
  end

  # GET /milestone/1/edit
  def edit
  end

  # POST /milestone
  # POST /milestone.json
  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.booksie_page = current_user.booksie_page
    #milestone.booksie_page_id ||=

    respond_to do |format|
      if @milestone.save
        format.html { redirect_to :back, notice: 'Milestone was successfully created.' }
        format.json { render :show, status: :created, location: @milestone }
      else
        format.html { render :new }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /milestone/1
  # PATCH/PUT /milestone/1.json
  def update
    respond_to do |format|
      if @milestone.update(milestone_params)
        format.html { redirect_to @milestone, notice: 'Milestone was successfully updated.' }
        format.json { render :show, status: :ok, location: @milestone }
      else
        format.html { render :edit }
        format.json { render json: @milestone.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /milestone/1
  # DELETE /milestone/1.json
  def destroy
    @milestone.destroy
    respond_to do |format|
      format.html { redirect_to milestone_url, notice: 'Milestone was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def milestone_params
      params.require(:milestone).permit(:date, :post, :booksie_page_id)
    end

end
