require 'date'

class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]

  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences)
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
        msg = "INIT"
        if (@report.report_type == "Guardias Activas")
          msg = calcular_cupo(@report)
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




 


  private
    
    def calcular_cupo (report)
      # -- INICIAR VARIABLES
      msg = "Inicializado"
      
      # -- RECUPERAR VALORES DEL FORMULARIO

      year = report.year
      month = report.month
      service_of_dependence = report.service_of_dependence
      total_hs = report.total_hs
      total_hs_umu = report.total_hs_umu
      total_hs_nov = report.total_hs_nov
      total_hs_exc = report.total_hs_exc
      total_hs_free = report.total_hs_free

      # -- PRIMERA PARTE
      # ---- calcular cantidades de cada día
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

      # ---- Verificar feriados y convertirlos
      free_days = FreeDay.where()
      FreeDay.where("cast(strftime('%m', day) as int) = ?", month).each do |fd|
        if !fd.day.sunday?
          if !fd.day.saturday?
            if fd.local?
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
            if fd.provincial? or fd.nacional?
              domingos+=1
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
            if fd.nacional? or fd.provincial?
              domingos+=1
              sabados-=1
            end
          end
        end
      end #-- fin each

      # ---- obtener días hábiles
      cant_dias_habiles = lunes + martes + miercoles + jueves + viernes

      # ---- Obtener la cobertura del servicio
      cobertura = Coverage.where(service_of_dependence: @report.service_of_dependence).first
      if !cobertura.nil?
        hs_dias_semana_cobertura = (cobertura.hs_lunes_diurnas * lunes)+(cobertura.hs_martes_diurnas * martes) + (cobertura.hs_miercoles_diurnas * miercoles) + (cobertura.hs_jueves_diurnas * jueves) + (cobertura.hs_viernes_diurnas * viernes)
        gs_dias_semana_cobertura = (cobertura.hs_lunes_nocturnas * lunes)+(cobertura.hs_martes_nocturnas * martes) + (cobertura.hs_miercoles_nocturnas * miercoles) + (cobertura.hs_jueves_nocturnas * jueves) + (cobertura.hs_viernes_nocturnas * viernes)
        hs_sabado_cobertura = cobertura.hs_sabado * sabados
        hs_domingo_cobertura = cobertura.hs_domingo * domingos
      else
        hs_dias_semana_cobertura = 0
        gs_dias_semana_cobertura = 0
        hs_sabado_cobertura = 0
        hs_domingo_cobertura = 0
      end


      # -- SEGUNDA PARTE
      # ---- Se obtienen todos los agentes del servicio
      agents_of_service  = AgentOfService.where(service_of_dependence: service_of_dependence)
      
      # ---- Inicializan variable
      hs_dias_semana_servicio = 0
      gs_dias_semana_servicio = 0
      hs_sabado_servicio = 0
      dotacion_actual = 0
      
      # ---- Se recorre cada agente del servicio y se acumulan variables
      agents_of_service.each do |agent_of_service|
        
        hs_dias_semana = 0
        gs_dias_semana = 0
        hs_sabados = 0
        
        # ---- Si no tiene Regimen Horario se inicializa en 30hs
        if agent_of_service.agent.hour_regime.nil?
          agent_of_service.agent.hour_regime = HourRegime.where(id:3).first #id 3 = 30hs S/G
        end
        hour_regime = agent_of_service.agent.hour_regime
        
        # ---- Si no es médico residente
        if !(agent_of_service.agent.agent_type.nil?)
          if !(agent_of_service.agent.agent_type.description == "Médico Residente")
            o = Observation.where(year:year, month:month, service_of_dependence:service_of_dependence).first  #Ver el mes

            observacion = o.observation_details.where(agent: agent_of_service.agent).first

            

            if observacion.nil?
              # ---- Si no tiene observaciones lo marco como 0
              code = 0
            else
              code = observacion.observation_description.code
            end
  

            # Si la observacion no es del tipo 1,2,3,4,5
            if !([0,1,2,3,4,5].include?(code))
              #si el servicio es radiologia o diagnostico por imagenes
              if ["Radiología","Diagnóstico por Imágenes"].include?(service_of_dependence.service.name)
                hs_dias_semana = 4 * cant_dias_habiles
              else
                # Si es un mensualizado para guardia
                if agent_of_service.agent.agent_type.description == "Mensualizad P/G"
                  hs_dias_semana = 6 * cant_dias_habiles
                else
                  if hour_regime.hours == 30
                    hs_dias_semana = 6 * cant_dias_habiles
                  elsif hour_regime.hours == 20
                    hs_dias_semana = 4 * cant_dias_habiles
                  elsif hour_regime.hours == 36
                    if hour_regime.with_guard
                      hs_dias_semana = 26
                    else
                      hs_dias_semana = 6 * cant_dias_habiles
                    end
                  end
                end
              end
  
              #Si jefe del servicio
              if agent_of_service.function == "Jefe del servicio"
                hs_dias_semana = hs_dias_semana * service_of_dependence.jefatura
              end
  
              if code == 6
                hs_dias_semana = hs_dias_semana *0.5
              end
  
              if code == 7
                hs_dias_semana = hs_dias_semana *0.833
              end
              hs_dias_semana_servicio =  hs_dias_semana_servicio + hs_dias_semana
              #Si el agente tiene un regime de 36
              if hour_regime.hours == 36
                if agent_of_service.function == "Jefe del servicio"
  
                  hs_sabados = sabados * 6 * @report.service_of_dependence.jefatura
                  
                else
                  hs_sabados = sabados * 6
                end
                hs_sabado_servicio = hs_sabado_servicio + hs_sabados
   
                if hour_regime.with_guard 
                  gs_dias_semana = 103
                  if agent_of_service.function == "Jefe del servicio"
                    gs_dias_semana = gs_dias_semana * @report.service_of_dependence.jefatura
                  end
  
                  if code == 6
                    gs_dias_semana = gs_dias_semana *0.5
                  end
  
                  if code == 7
                    gs_dias_semana = gs_dias_semana *0.833
                  end
  
                  gs_dias_semana_servicio =  gs_dias_semana_servicio + gs_dias_semana
  
                end
  
  
              end #end si regimen 36
              dotacion_actual = dotacion_actual+1
            end #-- end observacion code
          end #-- end no medico residente
        end
      end #-- end each agente
      
      #if consultorio tiene un servicio y no tiene agente 
        #hs_dias_semana_servicio = hs_dias_semana_servicio - consultorio.total_mensual
      #end
  
      porcentaje_mes = PercentageMonth.where(mes:@report.month).first
      if !porcentaje_mes.nil?    
        hs_dias_semana_servicio = hs_dias_semana_servicio * service_of_dependence.asistencial * ((100 - (service_of_dependence.ausentismo*100 + porcentaje_mes.valor))/100)
        gs_dias_semana_servicio = gs_dias_semana_servicio * service_of_dependence.asistencial * ((100 - (service_of_dependence.ausentismo*100 + porcentaje_mes.valor))/100)
        hs_sabado_servicio = hs_sabado_servicio * service_of_dependence.asistencial * ((100 - (service_of_dependence.ausentismo*100 + porcentaje_mes.valor))/100)
      end

      # -- Tercera Parte

      # ---- Calcular el resto de la cobertura (ej: hs_dias_semana_cobertura) - horas disponibles (ej: hs_dias_semana_servicio)
      hs_dias_semana_requeridas = hs_dias_semana_cobertura - hs_dias_semana_servicio
      gs_dias_semana_requeridas = gs_dias_semana_cobertura - gs_dias_semana_servicio
      hs_sabado_requeridas = (hs_sabado_cobertura - hs_sabado_servicio) * 1.5
      hs_domingo_requeridas = hs_domingo_cobertura * 2

      if service_of_dependence.con_guardia
        flag = 0
        if (gs_dias_semana_requeridas < 0) and (hs_dias_semana_requeridas < 0) and (hs_sabado_requeridas < 0)
          flag = 1
          if (gs_dias_semana_requeridas < 0) and (hs_dias_semana_requeridas < 0)
            gs_dias_semana_requeridas = 0
          end
          if (hs_sabado_requeridas < 0)  and (hs_dias_semana_requeridas < 0)
            hs_sabado_requeridas = 0
          end
          if hs_dias_semana_requeridas < 0
            hs_dias_semana_requeridas = 0
          end
        end
        byebug
        if flag = 1
          guardia_final = hs_domingo_requeridas
        else
          guardia_final = hs_dias_semana_requeridas + gs_dias_semana_requeridas + hs_sabado_requeridas + hs_domingo_requeridas
        end
      else
        guardia_final = hs_dias_semana_requeridas + gs_dias_semana_requeridas + hs_sabado_requeridas + hs_domingo_requeridas
      end

      # -- Cuarta Parte
      # ---- Obtener los 6 anteriores reportes del servicio al mes actual
      reportes = Report.where(service_of_dependence: service_of_dependence).last(6)
      
      acum = 0
      cont = 0
      
      reportes.each do |r|
        total_service = r.total_hs.to_i + r.total_hs_umu.to_i
        razon = total_service / dotacion_actual
        acum = acum + razon
        cont = cont + 1        
      end
      
      if acum != 0
        razon_final = acum / cont
      else
        razon_final = 0
      end

      cupo_historico = razon_final * dotacion_actual
      byebug
      if !guardia_final.nil?
        if guardia_final > cupo_historico
          cupo = cupo_historico
        else
          cupo = guardia_final
        end
      else
        cupo = guardia_final
      end
      
      #-- Quinta Parte
      # acumular total de horas del reporte de todos los agentes en total_hs_liquidadas
      total_hs_liquidadas = @report.total_hs.to_i + @report.total_hs_umu.to_i
  
      
      #-- Sexta Parte
      pv = 0
        
      # ---- Sobre el detalle de las novedad usando el tipo de horas.
      novedades = Novelty.where(month: month, year: year, service_of_dependence: service_of_dependence) #, report_type: "Guardias Activas", order_by(year_ref, month_ref))
  
      novedades.each do |novedad|
        arregl = []
        if pv == 0 
          month_ref_actual = novedad.month_ref
          year_ref_actual = novedad.year_ref
          valor = 0
          pv = 1
  
          if month_ref_actual != novedad.month_ref
            arreglo.add(novedad.year_ref_actual.to_s + novedad.month_ref_actual.to_s, valor)
            valor = 0
            month_ref_actual = novedad.month_ref
            year_ref_actual = novedad.year_ref
          end
          valor = valor + novedad.hour_to_add - novedad.hour_to_remove
        end
        arreglo.each do |a|
          year = String.split(a[0],0,4)
          if a[0].size == 6
            month = String.split(a[0],5,2)
          else
            month = String.split(a[0],5,1)
          end
  
          report_ref = Report.where(mont: month, year: year, service_of_dependence: @report.service_of_dependence, report_type: "Guardias Activas")
  
          diferencia = report_ref.total_hs_free - a[1]
  
          if diferencia > 0 
            report_ref.total_hs_free = diferencia
          else
            report_ref.total_hs_free = 0
            total_hs_liquidadas = total_hs_liquidadas - diferencia
          end
  
          report_ref.save
          
          
        end
      end  
      #-- Septima Parte
     
      #-- Ocatava Parte
      
      if cupo >= total_hs_liquidadas
        @report.total_hs_free = cupo - total_hs_liquidadas
        msg = "Se acepta liquidacion"
        @report.estado = "Validado"
      else
        exc = total_hs_liquidadas - cupo
        @report.total_hs_exc = exc
        msg = "Se RECHAZA la liquidación por excederse en el CUPO. Total de horas excedidas" + exc
      end
      ## acumular total de horas del reporte de todos los agentes en total_hs_liquidadas
      
      
      return msg
    end



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