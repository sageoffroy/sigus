require 'date'

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    if !params[:status].nil?
      estado = params[:status].gsub!('-',' ') || params[:status]
    end
    if estado.nil?
      @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences)
    else
      @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: estado)
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report_details = ReportDetail.where(report:@report)
  end

  # GET /reports/new
  def new
    @report = Report.new
    @report.estado = "Nuevo"
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  def new_active
    @report = Report.new
    @report.report_type = "Guardias Activas"
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  def new_pasive
    @report = Report.new
    @report.report_type = "Guardias Pasivas"
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  def new_extra_hours
    @report = Report.new
    @report.report_type = "Horas Extras"
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  def new_monthly_guard
    @report = Report.new
    @report.report_type = "Mensualizado P/G"
    @services_of_dependence = current_user.dependence.service_of_dependences
    @agents = Agent.where(id:Agent.first.id)
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id]) #ver si se puede mejorar
    if current_user.dependence.nil?
      current_user.dependence = Dependence.where(code:106).first
    end
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @report.service_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    
    

    respond_to do |format|
      if @report.save
        if (@report.report_type == "Guardias Activas")
          calcular_cupo(@report)
        else
          @report.estado = "Validado"
          @report.save
        end
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @report.service_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
        if @report.report_type == "Guardias Activas"
          format.html { render 'reports/new_active' }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        elsif @report.report_type == "Guardias Pasivas"
          format.html { render 'reports/new_pasive' }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        elsif @report.report_type == "Horas Extras"
          format.html { render '/reports/new_extra_hours' }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        elsif @report.report_type == "Mensualizado P/G"
          format.html { render '/reports/new_monthly_guard' }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    respond_to do |format|
      if @report.update(report_params)
        msg = "Reporte Actualizado"
        if (@report.report_type == "Guardias Activas")
          msg = calcular_cupo(@report)
        else
          @report.estado = "Validado"
          @report.save
        end
        format.html { redirect_to @report, notice: msg}
        format.json { render :show, status: :ok, location: @report }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
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


  def check_director
    if current_user.director? or current_user.admin?
      id = params[:id]
      report = Report.where(id:id).first
      if report.estado === "Aprob Director Hosp"
        report.estado = "Validado"
        msg = "Se ha vuelto al estado anterior del reporte."
      else
        report.estado = "Aprob Director Hosp"
        msg = "Se ha Aprobado el reporte."
      end
      report.save
    end
    respond_to do |format|
      format.html { redirect_to reports_url, notice: msg }
    end
  end

  private
    
    def calcular_cupo (report)
      
    end



    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params
      params.require(:report).permit(:year, :month, :service_of_dependence_id, :total_hs,:total_hs_umu,:total_hs_nov,:total_hs_exc,:total_hs_free,:report_type,:dotacion,:estado,:consolidado,:user_id,
        report_details_attributes: [:id, :url, :_destroy, :agent_id, :belong_service,:total_hours, :total_hours_gs, :total_hours_umu,
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