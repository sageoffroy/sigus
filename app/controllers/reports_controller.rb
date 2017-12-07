require 'date'

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    if current_user.hospital?
      @reports = Report.where(user: current_user)
    else
      @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences)
    end
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

  # GET /reports/1/edit
  def edit
    if current_user.dependence.nil?
      current_user.dependence = Dependence.where(code:106).first
    end
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))

    @report = Report.find(params[:id]) #ver si se puede mejorar
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(report_params)
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
    
    if (@report.report_type == "Guardias Activas")
      calcular_cupo(@report)
    end

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render :show, status: :created, location: @report }
      else
        if @report.report_type == "Guardias Activas"
          format.html { render 'reports/new_active' }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        elsif @report.report_type == "Guardias Pasivas"
          format.html { render 'reports/new_pasive' }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        elsif @report.report_type == "Horas Extras"
          format.html { render '/reports/new_extra_hours' }
          format.json { render json: @report.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /reports/1
  # PATCH/PUT /reports/1.json
  def update
    
    if (@report.report_type == "Guardias Activas")
      calcular_cupo(@report)
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


  #def calcular_cupo (report)
    ##recuperar valores del form
    #year = report.year
    #month = report.month
    #service_of_dependence = report.service_of_dependence
#
    ##---- PRIMERA PARTE
#
    ##calcular cantidades de cada día
    #first_day = Date.new year, month, 1
    #last_day = Date.civil year, month, -1
#
    #days_from_month = (first_day..last_day).map{ |date| date.strftime("%a") }
#
    #lunes = days_from_month.count("Mon")
    #martes = days_from_month.count("Tue")
    #miercoles = days_from_month.count("Wed")
    #jueves = days_from_month.count("Thu")
    #viernes = days_from_month.count("Fri")
    #sabados = days_from_month.count("Sat")
    #domingos = days_from_month.count("Sun")
#
     ##Verificar feriados y convertirlos
#
    #free_days = FreeDay.where()
    ## SQL       Model.where('extract(month from date_column) = ?', desired_month)
    ## SQLite    Model.where("cast(strftime('%m', date_column) as int) = ?", desired_month)
#
    #FreeDay.where("cast(strftime('%m', day) as int) = ?", month).each do |fd|
      #if !fd.day.sunday?
        #if !fd.day.saturday?
          #if fd.local? or fd.provincial?
            #sabados+=1
            #case fd.day.strftime("%A")
            #when 'Monday'
              #lunes-=1
            #when 'Tuesday'
              #martes-=1
            #when 'Wednesday'
              #miercoles-=1
            #when 'Thursday'
              #jueves-=1
            #when 'Friday'
              #viernes-=1
            #end
          #end
        #else
          #if fd.nacional?
            #domingos+=1
            #sabados-=1
          #end
        #end
      #end
    #end
#
    ##obtener dias habiles
    #cant_dias_habiles = lunes + martes + miercoles + jueves + viernes
#
#
    ##---- SEGUNDA PARTE
    ## Se obtienen todos los agentes del servicio
    #agents_of_service  = AgentOfService.where(service_of_dependence: service_of_dependence)
#    
    ## inicializan variable
    #hs_dias_semana_servicio = 0
    #gs_dias_semana_servicio = 0
    #hs_sabado_servicio = 0
    #dotacion_actual = 0
    ##Se recorre cada agente del servicio y se acumulan variables
    #agents_of_service.each do |agent_of_service|
#      
      #hs_dias_semana = 0
      #gs_dias_semana = 0
      #hs_sabados = 0
#      
      ##Si no tiene Regimen Horario lo inicializo en 30hs
      #if agent_of_service.agent.hour_regime.nil?
        #agent_of_service.agent.hour_regime = HourRegime.where(id:3).first
      #end
      #hour_regime = agent_of_service.agent.hour_regime
#      
      ##Si no es médico residente
      #if !(agent_of_service.agent.agent_type.description == "Médico Residente")
        #observacion = Observation.where(agent:agent_fo_service.agent).first
        ## Si no tiene observaciones lo marco como 0, sino uso codigo del tipo de observacion
        #if observation.nil?
          #code = 0
        #else
          #code = observacion.observation_description.code
        #end
        ## Si no cuenta con observaciones o la observacion es del tipo 1,2,3,4 o 6
        #if !([1,2,3,4,5].include?(code))
          ##si el servicio es radiologia o diagnostico por imagenes
          #if ["Radiología","Diagnóstico por Imágenes"].include?(service_of_dependence.service.name)
            #hs_dias_semana = 4 * cant_dias_habiles
          #else
            ## Si es un mensualizado para guardia
            #if agent_of_service.agent.agent_type.description == "Mensualizad P/G"
              #hs_dias_semana = 6 * cant_dias_habiles
            #else
              #if hour_regime.hours == 30
                #hs_dias_semana = 6 * cant_dias_habiles
              #elsif hour_regime.hours == 20
                #hs_dias_semana = 4 * cant_dias_habiles
              #elsif hour_regime.hours == 36
                #if hour_regime.with_guard
                  #hs_dias_semana = 52
                #else
                  #hs_dias_semana = 6 * cant_dias_habiles
                #end
              #end
            #end
          #end
#
          ##Si jefe del servicio
          #if agent_of_service.function == "Jefe del servicio"
            #hs_dias_semana = hs_dias_semana * service_of_dependence.jefatura
          #end
#
          #if code == 6
            #hs_dias_semana = hs_dias_semana *0.5
          #end
#
          #if code == 7
            #hs_dias_semana = hs_dias_semana *0.833
          #end
#
#          
#
          #hs_dias_semana_servicio =  hs_dias_semana_servicio + hs_dias_semana
#
          ##Si el agente tiene un regime de 36
          #if hour_regime.hours == 36
            #if hour_regime.with_guard 
              #gs_dias_semana = 103
              #if agent_of_service.function == "Jefe del servicio"
               #gs_dias_semana = gs_dias_semana * @report.service_of_dependence.jefatura
              #end
#
              #if code == 5
                #gs_dias_semana = gs_dias_semana *0.5
              #end
#
              #if code == 7
                #gs_dias_semana = gs_dias_semana *0.833
              #end
#
              #gs_dias_semana_servicio =  gs_dias_semana_servicio + gs_dias_semana
            #end
          #end
          #dotacion_actual = dotacion_actual+1
        #end
      #end # no medico residente
    #end #agente each
#    
    ## if consultorio tiene un servicio y no tiene agente 
      ##hs_dias_semana_servicio = hs_dias_semana_servicio - consultorio.total_mensual
    ##end

    #porcentaje_mes_valor = PorcentajeMes.where(mes:@report.month).first).valor
#
#
    #hs_dias_semana_servicio = hs_dias_semana_servicio * service_of_dependence.asistencial * (100 - (service_of_dependence.ausentismo * porcentaje_mes_valor)
    #gs_dias_semana_servicio = gs_dias_semana_servicio * service_of_dependence.asistencial * (100 - service_of_dependence.ausentismo*porcentaje_mes_valor)
    #hs_sabado_servicio = hs_sabado_servicio * service_of_dependence.asistencial * (100 - service_of_dependence.ausentismo*porcentaje_mes_valor)


    #-- Tercera Parte

  #end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_report
      @report = Report.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def report_params

        #report fields
        #t.integer :year, foreign_key: true
        #t.integer :month, foreign_key: true
        #t.references :service_of_dependence, foreign_key: true
        #t.integer :total_hs
        #t.integer :total_hs_umu
        #t.integer :total_hs_nov
        #t.integer :total_hs_exc
        #t.integer :total_hs_free
        #t.string :report_type, foreign_key: true
        #t.integer :dotacion
        #t.string :estado         #["Rechazado" , "Validado", "Aprob Director Hosp", "Aprob Director A/P", "Aprob Sueldos"]
        #t.boolean :consolidado
        #t.references :user


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