def calcular_cupo (report)
    #recuperar valores del form
    year = report.year
    month = report.month
    service_of_dependence = report.service_of_dependence

    #---- PRIMERA PARTE

    #calcular cantidades de cada día
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

    #obtener dias habiles
    cant_dias_habiles = lunes + martes + miercoles + jueves + viernes


    #---- SEGUNDA PARTE
    # Se obtienen todos los agentes del servicio
    agents_of_service  = AgentOfService.where(service_of_dependence: service_of_dependence)
    
    # inicializan variable
    hs_dias_semana_servicio = 0
    gs_dias_semana_servicio = 0
    hs_sabado_servicio = 0
    dotacion_actual = 0
    #Se recorre cada agente del servicio y se acumulan variables
    agents_of_service.each do |agent_of_service|
      
      hs_dias_semana = 0
      gs_dias_semana = 0
      hs_sabados = 0
      
      #Si no tiene Regimen Horario lo inicializo en 30hs
      if agent_of_service.agent.hour_regime.nil?
        agent_of_service.agent.hour_regime = HourRegime.where(id:3).first
      end
      hour_regime = agent_of_service.agent.hour_regime
      
      #Si no es médico residente
      if !(agent_of_service.agent.agent_type.description == "Médico Residente")
        observacion = Observation.where(agent:agent_fo_service.agent).first
        # Si no tiene observaciones lo marco como 0, sino uso codigo del tipo de observacion
        if observation.nil?
          code = 0
        else
          code = observacion.observation_description.code
        end
        # Si no cuenta con observaciones o la observacion es del tipo 1,2,3,4 o 6
        if !([1,2,3,4,5].include?(code))
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
                  hs_dias_semana = 52
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
            if hour_regime.with_guard 
              gs_dias_semana = 103
              if agent_of_service.function == "Jefe del servicio"
               gs_dias_semana = gs_dias_semana * @report.service_of_dependence.jefatura
              end

              if code == 5
                gs_dias_semana = gs_dias_semana *0.5
              end

              if code == 7
                gs_dias_semana = gs_dias_semana *0.833
              end

              gs_dias_semana_servicio =  gs_dias_semana_servicio + gs_dias_semana
            end
          end
          dotacion_actual = dotacion_actual+1
        end
      end # no medico residente
    end #agente each
    
    # if consultorio tiene un servicio y no tiene agente 
      #hs_dias_semana_servicio = hs_dias_semana_servicio - consultorio.total_mensual
    #end

    porcentaje_mes_valor = PorcentajeMes.where(mes:@report.month).first).valor


    hs_dias_semana_servicio = hs_dias_semana_servicio * service_of_dependence.asistencial * (100 - (service_of_dependence.ausentismo * porcentaje_mes_valor)
    gs_dias_semana_servicio = gs_dias_semana_servicio * service_of_dependence.asistencial * (100 - service_of_dependence.ausentismo*porcentaje_mes_valor)
    hs_sabado_servicio = hs_sabado_servicio * service_of_dependence.asistencial * (100 - service_of_dependence.ausentismo*porcentaje_mes_valor)


    #-- Tercera Parte
    
  end