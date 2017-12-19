class ObservationDetailsController < ApplicationController
  before_action :set_observation_detail, only: [:show, :edit, :update, :destroy]

  # GET /observation_details
  # GET /observation_details.json
  def index
    @observation_details = ObservationDetail.all
  end

  # GET /observation_details/1
  # GET /observation_details/1.json
  def show
  end

  # GET /observation_details/new
  def new
    @observation_detail = ObservationDetail.new
  end

  # GET /observation_details/1/edit
  def edit
  end

  # POST /observation_details
  # POST /observation_details.json
  def create
    @observation_detail = ObservationDetail.new(observation_detail_params)

    respond_to do |format|
      if @observation_detail.save
        format.html { redirect_to @observation_detail, notice: 'Observation detail was successfully created.' }
        format.json { render :show, status: :created, location: @observation_detail }
      else
        format.html { render :new }
        format.json { render json: @observation_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observation_details/1
  # PATCH/PUT /observation_details/1.json
  def update
    respond_to do |format|
      if @observation_detail.update(observation_detail_params)
        format.html { redirect_to @observation_detail, notice: 'Observation detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation_detail }
      else
        format.html { render :edit }
        format.json { render json: @observation_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observation_details/1
  # DELETE /observation_details/1.json
  def destroy
    @observation_detail.destroy
    respond_to do |format|
      format.html { redirect_to observation_details_url, notice: 'Observation detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observation_detail
      @observation_detail = ObservationDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_detail_params
      params.require(:observation_detail).permit(:observation_id, :agent_id, :observation_description_id, :date_from, :total_days, :description)
    end
end
