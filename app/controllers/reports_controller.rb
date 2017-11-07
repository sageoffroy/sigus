class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  # GET /reports/new
  def new
    @report = Report.new
    @report_details = @report.report_details.build
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
    #@agents = Agent.all
  end

  # GET /reports/1/edit
  def edit
    if current_user.dependence.nil?
      current_user.dependence = Dependence.where(code:106).first
    end
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))

    @report = Report.find(params[:id])
    @report_details = @report.report_details.first
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        format.html { render :new }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
    respond_to do |format|
      if @report.update(report_params)
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { render :show, status: :ok, location: @report }
      else
        format.html { render :edit }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @user = current_user
    @report.destroy
    respond_to do |format|
      format.html { redirect_to reports_url, notice: 'Report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:year, :month, :total_office_hours, :service_of_dependence_id, :user_id, report_details_attributes: [:id, :url, :_destroy, :agent_id, :belong_service, :total_hours, :fm, :tnf, :tt, :hours_to_add, :hours_to_remove, :total_office_hours, :day1, :day2, :day3, :day4 ,:day5, :day6, :day7, :day8, :day9, :day10, :day11, :day12, :day13, :day14, :day15, :day16, :day17, :day18, :day19, :day20, :day21, :day22, :day23, :day24, :day25 ,:day26 ,:day27, :day28, :day29, :day30, :day31, observations_attributes: [:id, :observation_description_id, :date_up, :days], rotative_turns_attributes: [:id, :days, :is_complete]])
    end
end
