class DaysOfReportDetailsController < ApplicationController
  before_action :set_days_of_report_detail, only: [:show, :edit, :update, :destroy]

  # GET /days_of_report_details
  # GET /days_of_report_details.json
  def index
    @days_of_report_details = DaysOfReportDetail.all
  end

  # GET /days_of_report_details/1
  # GET /days_of_report_details/1.json
  def show
  end

  # GET /days_of_report_details/new
  def new
    @days_of_report_detail = DaysOfReportDetail.new
  end

  # GET /days_of_report_details/1/edit
  def edit
  end

  # POST /days_of_report_details
  # POST /days_of_report_details.json
  def create
    @days_of_report_detail = DaysOfReportDetail.new(days_of_report_detail_params)

    respond_to do |format|
      if @days_of_report_detail.save
        format.html { redirect_to @days_of_report_detail, notice: 'Days of report detail was successfully created.' }
        format.json { render :show, status: :created, location: @days_of_report_detail }
      else
        format.html { render :new }
        format.json { render json: @days_of_report_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /days_of_report_details/1
  # PATCH/PUT /days_of_report_details/1.json
  def update
    respond_to do |format|
      if @days_of_report_detail.update(days_of_report_detail_params)
        format.html { redirect_to @days_of_report_detail, notice: 'Days of report detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @days_of_report_detail }
      else
        format.html { render :edit }
        format.json { render json: @days_of_report_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /days_of_report_details/1
  # DELETE /days_of_report_details/1.json
  def destroy
    @days_of_report_detail.destroy
    respond_to do |format|
      format.html { redirect_to days_of_report_details_url, notice: 'Days of report detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_days_of_report_detail
      @days_of_report_detail = DaysOfReportDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def days_of_report_detail_params
      params.require(:days_of_report_detail).permit(:report_details_id, :day, :cant)
    end
end
