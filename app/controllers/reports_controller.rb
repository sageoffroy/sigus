require 'date'

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
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    #-- Primera Parte
    year = @report.year
    month = @report.month
    day = 1
    
    date_1 = Date.new year, month, day

    byebug











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

    #-- Primera Parte
    year = @report.year
    month = @report.month
    
      #Calcular cantidades de cada día
    first_day = Date.new year, month, 1
    last_day = Date.civil year, month, -1

    days_from_month = (first_day..last_day).map{ |date| date.strftime("%a") }

    lunes = days_from_month.count("Mon")
    martes = days_from_month.count("Tue")
    miercoles = days_from_month.count("Wed")
    jueves = days_from_month.count("Thu")
    viernes = days_from_month.count("Fri")
    sabados = days_from_month.count("Sat")
    domingo = days_from_month.count("Sun")

      #Verificar feriados y convertirlos

    free_days = FreeDay.where()
    # SQL       Model.where('extract(month from date_column) = ?', desired_month)
    # SQLite    Model.where("cast(strftime('%m', date_column) as int) = ?", desired_month)

    FreeDay.where("cast(strftime('%m', day) as int) = ?", month).each do |fd|
      if !fd.day.sunday?
        if !fd.day.saturday?

      byebug
    end
    


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
      params.require(:report).permit(:year, :month, :total_office_hours, :service_of_dependence_id, :user_id,
        report_details_attributes: [:id, :url, :_destroy, :agent_id, :belong_service, :total_hours, :total_hours_umu, :fm, :tnf, :tt, :hours_to_add, :hours_to_remove, :total_office_hours,
        observation_attributes: [:id, :content,:observation_description_id, :date_up, :days],
        rotative_turn_attributes: [:id, :days, :is_complete],
        day1_attributes: [:id, :hours, :is_umu],
        day2_attributes: [:id, :hours, :is_umu],
        day3_attributes: [:id, :hours, :is_umu],
        day4_attributes: [:id, :hours, :is_umu],
        day5_attributes: [:id, :hours, :is_umu],
        day6_attributes: [:id, :hours, :is_umu],
        day7_attributes: [:id, :hours, :is_umu],
        day8_attributes: [:id, :hours, :is_umu],
        day9_attributes: [:id, :hours, :is_umu],
        day10_attributes: [:id, :hours, :is_umu],
        day11_attributes: [:id, :hours, :is_umu],
        day12_attributes: [:id, :hours, :is_umu],
        day13_attributes: [:id, :hours, :is_umu],
        day14_attributes: [:id, :hours, :is_umu],
        day15_attributes: [:id, :hours, :is_umu],
        day16_attributes: [:id, :hours, :is_umu],
        day17_attributes: [:id, :hours, :is_umu],
        day18_attributes: [:id, :hours, :is_umu],
        day19_attributes: [:id, :hours, :is_umu],
        day20_attributes: [:id, :hours, :is_umu],
        day21_attributes: [:id, :hours, :is_umu],
        day22_attributes: [:id, :hours, :is_umu],
        day23_attributes: [:id, :hours, :is_umu],
        day24_attributes: [:id, :hours, :is_umu],
        day25_attributes: [:id, :hours, :is_umu],
        day26_attributes: [:id, :hours, :is_umu],
        day27_attributes: [:id, :hours, :is_umu],
        day28_attributes: [:id, :hours, :is_umu],
        day29_attributes: [:id, :hours, :is_umu],
        day30_attributes: [:id, :hours, :is_umu],
        day31_attributes: [:id, :hours, :is_umu]
        ])
    end
end