class NoveltyDetailsController < ApplicationController
  before_action :set_novelty_detail, only: [:show, :edit, :update, :destroy]

  # GET /novelty_details
  # GET /novelty_details.json
  def index
    @novelty_details = NoveltyDetail.all
  end

  # GET /novelty_details/1
  # GET /novelty_details/1.json
  def show
  end

  # GET /novelty_details/new
  def new
    @novelty_detail = NoveltyDetail.new
  end

  # GET /novelty_details/1/edit
  def edit
  end

  # POST /novelty_details
  # POST /novelty_details.json
  def create
    @novelty_detail = NoveltyDetail.new(novelty_detail_params)

    respond_to do |format|
      if @novelty_detail.save
        format.html { redirect_to @novelty_detail, notice: 'Novelty detail was successfully created.' }
        format.json { render :show, status: :created, location: @novelty_detail }
      else
        format.html { render :new }
        format.json { render json: @novelty_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /novelty_details/1
  # PATCH/PUT /novelty_details/1.json
  def update
    respond_to do |format|
      if @novelty_detail.update(novelty_detail_params)
        format.html { redirect_to @novelty_detail, notice: 'Novelty detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @novelty_detail }
      else
        format.html { render :edit }
        format.json { render json: @novelty_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /novelty_details/1
  # DELETE /novelty_details/1.json
  def destroy
    @novelty_detail.destroy
    respond_to do |format|
      format.html { redirect_to novelty_details_url, notice: 'Novelty detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novelty_detail
      @novelty_detail = NoveltyDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def novelty_detail_params
      params.require(:novelty_detail).permit(:novelty_id, :agent_id, :novelty_type_id, :report_type, :year_ref, :month_ref, :description, :hours_to_add, :hours_to, :remove, :is_umu, :is_habitual, :associated_concept)
    end
end
