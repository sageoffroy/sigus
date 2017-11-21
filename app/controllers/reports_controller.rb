require 'date'

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    byebug
    @reports = Report.where(user: current_user)
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
    domingos = days_from_month.count("Sun")

      #Verificar feriados y convertirlos

    free_days = FreeDay.where()
    # SQL       Model.where('extract(month from date_column) = ?', desired_month)
    # SQLite    Model.where("cast(strftime('%m', date_column) as int) = ?", desired_month)

    FreeDay.where("cast(strftime('%m', day) as int) = ?", month).each do |fd|
      if !fd.day.sunday?
        if !fd.day.saturday?
          if fd.local? or fd.provincial?
            sabados+=1
            case fd.day.strftime("%A")
            when 'Monday'
              lunes-=1
            when 'Tuesday'
              martes-=1
            when 'Wednesday'
              miercoles-=1
            when 'Thursday'
              jueves-=1
            when 'Friday'
              viernes-=1
            end
          end
        else
          if fd.nacional?
            domingos+=1
            sabados-=1
          end
        end
      end
    end

    cant_dias_habiles = lunes + martes + miercoles + jueves + viernes
    
    # Obtener la cobertura del servicio

    # hs_dias_semana_cobertura = hs_lunes_diurnas * lunes + .... + hs_viernes_diurnas * viernes
    # gs_dias_semana_cobertura = hs_lunes_nocturnas * lunes  + .... + hs_viernes_noscturnes * viernes
    # hs_sabado_cobertura = hs_sabado * sabados
    # hs_domingo_cobertura = hs_domingo * domingo


    # ---- Segunda Parte

    # agentes = obtengo todos los agentes del servicio para el service_of_dependence del reporte
    
    # hs_dias_semana_servicio = 0
    # gs_dias_semana_servicio = 0
    # hs_sabado_servicio = 0
    
    # Por Agente
      # 1, 2, 3, 4, 6:  Ignorar al agente
      # 5: él cálculo debe hacerse y tomar luego la mitad de ese valor
      # 7: él cálculo debe hacerse y tomar luego el porcentaje 83.33 de ese valor.

      # Sacar residentes para el calculo
      #si el servicio es radiologia (diagnostico por imagen)
        # obtener dias_semana = 
          # 4 * cant_dias_habiles
      #sino
        # forzar a los mensualizado p/guardia regimeen horario en 30hs
        # obtener hs_dias_semana = 
            # si el regime horario es 30
              # 6 * cant_dias_habiles -> Hs
            # si es 20 
              # 4 * cant_dias_habiles -> Hs
            # si es 36
              # si es S/G
                # 6 * cant_dias_habiles -> Hs 
              # si es C/G
                # 52 -> Hs 
        # Ver las horas consultorio por agente (todavia no desarrollado)
      # fin si
      # Si tiene job_function (en este caso va a ser jefe de servicio indistinto de si cobra jerarquia)
        # hs_dias_semana = hs_dias_semana * service_of_dependence.jefatura
      # fin si
      # hs_dias_semana_servicio =  hs_dias_semana_servicio + hs_dias_semana

      # si el agente tiene regimen horario 36 c/g
        # gs_dias_semana = 103
        # Si tiene job_function (en este caso va a ser jefe de servicio indistinto de si cobra jerarquia)
          # gs_dias_semana = gs_dias_semana * service_of_dependence.jefatura
        # fin si
        # gs_dias_semana_servicio =  gs_dias_semana_servicio + gs_dias_semana


      # si el regime horario es 36
        # hs_sabados = 6 * sabados -> Hs
        # Si tiene job_function (en este caso va a ser jefe de servicio indistinto de si cobra jerarquia)
          # hs_sabados = hs_sabados * service_of_dependence.jefatura
        # fin si
        # hs_sabado_servicio =  hs_sabado_servicio + hs_sabados

      # dotacion_actual += 1
    # fin por agente

    # Si consultorio tiene un servicio y no tiene agente 
      #hs_dias_semana_servicio = hs_dias_semana_servicio - consultorio.total_mensual

    # hs_dias_semana_servicio = hs_dias_semana_servicio * service_of_dependence.asistencial * (100 - service_of_dependence.ausentismo)
    # gs_dias_semana_servicio = gs_dias_semana_servicio * service_of_dependence.asistencial * (100 - service_of_dependence.ausentismo)
    # hs_sabado_servicio = hs_sabado_servicio * service_of_dependence.asistencial * (100 - service_of_dependence.ausentismo)
      
    
    #-- Tercera Parte

    # calcular el resto de la cobertura (ej: hs_dias_semana_cobertura) - horas disponibles (ej: hs_dias_semana_servicio)
    # hs_dias_semana_requeridas = hs_dias_semana_cobertura - hs_dias_semana_servicio
    # gs_dias_semana_requeridas = gs_dias_semana_cobertura - gs_dias_semana_servicio
    # hs_sabado_requeridas = (hs_sabado_cobertura - hs_sabado_servicio) * 1.5
    # hs_domingo_requeridas = hs_domingo_cobertura * 2


    # si service_of_dependence.guardia 
      #flag = 0
      #si gs_dias_semana_requeridas < 0 y hs_dias_semana_requeridas < 0 y hs_sabado_requeridas < 0
        # flag = 1
      # si gs_dias_semana_requeridas < 0 y hs_dias_semana_requeridas < 0
        # gs_dias_semana_requeridas = 0
      # si hs_sabado_requeridas < 0 y hs_dias_semana_requeridas < 0
        # hs_sabado_requeridas = 0
      # si hs_dias_semana_requeridas < 0
        # hs_dias_semana_requeridas = 0
      # si flag = 1
        # guardia_final = hs_domingo_requeridas
      # sino
        # guardia_final = hs_dias_semana_requeridas + gs_dias_semana_requeridas + hs_sabado_requeridas + hs_domingo_requeridas
    

    # sino service_of_dependence.guardia
      # guardia_final = hs_dias_semana_requeridas + gs_dias_semana_requeridas + hs_sabado_requeridas + hs_domingo_requeridas

    # fin si

    #--  Falta 4ta parte (Calculo Historico)

    #-- Quinta Parte
    
    # acumular total de horas del reporte de todos los agentes en total_hs_liquidadas


    #-- Falta 6ta Parte (Ajuste por Novedades)


    #-- Septima Parte

    #Posteriormente grabar el registro en la tabla LIQUIDACIONES,
      #liquidacion.total_hs_liquidadas
      #liquidacion.total_hs_libres = guardia_final - total_hs_liquidadas
      #liquidacion.dotacion = dotacion_actual

    # si guardia_final >= total_hs_liquidadas
      # MSG "Se acepta liquidacion"
      #Si en el campo liquidacion.validado_personal
    # sino
      # MSG "Se RECHAZA la liquidación por excederse en el CUPO. Total de horas excedidas xxx” (xxx es la diferencia entre total_hs_liquidadas y guardia_final.
      # no en el campo liquidacion.validado_personal

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
      params.require(:report).permit(:year, :month, :service_of_dependence_id, :user_id,
        report_details_attributes: [:id, :url, :_destroy, :agent_id, :belong_service,:total_hours, :total_hours_gs, :total_hours_umu, :fm, :tnf, :tt, :hours_to_add, :hours_to_remove, :total_office_hours,
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