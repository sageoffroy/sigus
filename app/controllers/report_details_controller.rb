class ReportDetailsController < ApplicationController
  before_action :set_report_detail, only: [:show, :edit, :update, :destroy]

  # GET /report_details
  # GET /report_details.json
  def index
    @report_details = ReportDetail.all

  end

  # GET /report_details/1
  # GET /report_details/1.json
  def show
  end

  # GET /report_details/new
  def new
    @report_detail = ReportDetail.new
    @report_detail.observations.build

  end

  # GET /report_details/1/edit
  def edit

  end

  # POST /report_details
  # POST /report_details.json
  def create
    @report_detail = ReportDetail.new(report_detail_params)
    respond_to do |format|
      if @report_detail.save
        format.html { redirect_to @report_detail, notice: 'Report detail was successfully created.' }
        format.json { render :show, status: :created, location: @report_detail }
      else
        
        format.html { render :new }
        format.json { render json: @report_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /report_details/1
  # PATCH/PUT /report_details/1.json
  def update
    respond_to do |format|
      if @report_detail.update(report_detail_params)
        format.html { redirect_to @report_detail, notice: 'Report detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @report_detail }
      else
        format.html { render :edit }
        format.json { render json: @report_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /report_details/1
  # DELETE /report_details/1.json
  def destroy
    @report_detail.destroy
    respond_to do |format|
      format.html { redirect_to report_details_url, notice: 'Report detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report_detail
      @report_detail = ReportDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_detail_params
      params.require(:report_detail).permit(:report_id,:agent_id,:belong_service,:total_hours,:fm, :tnf, :tt,:hours_to_add, :hours_to_remove,:total_office_hours, :day1, :day2, :day3, :day4, :day5, :day6, :day7, :day8, :day9,:day10,:day11,:day12,:day13,:day14,:day15,:day16,:day17,:day18,:day19,:day20,:day21,:day22,:day23,:day24,:day25,:day26,:day27,:day28,:day29,:day30,:day31, observations_attributes: [:id, :_destroy, :description, :date_up, :days], rotative_turns_attributes: [:id, :_destroy, :days, :is_complete])
    end
end
