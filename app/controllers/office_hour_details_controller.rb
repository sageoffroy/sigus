class OfficeHourDetailsController < ApplicationController
  before_action :set_office_hour_detail, only: [:show, :edit, :update, :destroy]

  # GET /office_hour_details
  # GET /office_hour_details.json
  def index
    @office_hour_details = OfficeHourDetail.all
  end

  # GET /office_hour_details/1
  # GET /office_hour_details/1.json
  def show
  end

  # GET /office_hour_details/new
  def new
    @office_hour_detail = OfficeHourDetail.new
  end

  # GET /office_hour_details/1/edit
  def edit
  end

  # POST /office_hour_details
  # POST /office_hour_details.json
  def create
    @office_hour_detail = OfficeHourDetail.new(office_hour_detail_params)

    respond_to do |format|
      if @office_hour_detail.save
        format.html { redirect_to @office_hour_detail, notice: 'Office hour detail was successfully created.' }
        format.json { render :show, status: :created, location: @office_hour_detail }
      else
        format.html { render :new }
        format.json { render json: @office_hour_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_hour_details/1
  # PATCH/PUT /office_hour_details/1.json
  def update
    respond_to do |format|
      if @office_hour_detail.update(office_hour_detail_params)
        format.html { redirect_to @office_hour_detail, notice: 'Office hour detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_hour_detail }
      else
        format.html { render :edit }
        format.json { render json: @office_hour_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_hour_details/1
  # DELETE /office_hour_details/1.json
  def destroy
    @office_hour_detail.destroy
    respond_to do |format|
      format.html { redirect_to office_hour_details_url, notice: 'Office hour detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_hour_detail
      @office_hour_detail = OfficeHourDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_hour_detail_params
      params.require(:office_hour_detail).permit(:office_hour_id, :agent_id, :turno_hora, :lunes, :martes, :miercoles, :jueves, :viernes, :sabado, :domingo, :total_hours)
    end
end
