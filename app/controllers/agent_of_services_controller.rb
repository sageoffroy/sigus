require 'csv-mapper'
include CsvMapper

class AgentOfServicesController < ApplicationController
  before_action :set_agent_of_service, only: [:show, :edit, :update, :destroy]

  # GET /agent_of_services
  # GET /agent_of_services.json
  def index
    @user = current_user
    dependence = Dependence.where(code: @user.dependence.code).first
    if @user.hospital?
      @services_of_dependences = dependence.service_of_dependences
    else
      @services_of_dependences = dependence.service_of_dependences

    end
  end

  # GET /agent_of_services/1
  # GET /agent_of_services/1.json
  def show
    @user = current_user
  end

  # GET /agent_of_services/new
  def new
    @agent_of_service = AgentOfService.new
    @user = current_user
    if @user.has_role? :hospital
      dependence = @user.dependence
      services_of_dependence = dependence.services
      agents_of_service = AgentOfService.where(service_of_dependence: services_of_dependence)
      @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
    else
      @agents = Agent.all
    end     
  end

  # GET /agent_of_services/1/edit
  def edit

  end

  # POST /agent_of_services
  # POST /agent_of_services.json
  def create
    @agent_of_service = AgentOfService.new(agent_of_service_params)
    @user = current_user  
    respond_to do |format|
      if @agent_of_service.save
        format.html { redirect_to @agent_of_service, notice: 'Agent of service was successfully created.' }
        format.json { render :show, status: :created, location: @agent_of_service }
      else
        format.html { render :new }
        format.json { render json: @agent_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agent_of_services/1
  # PATCH/PUT /agent_of_services/1.json
  def update
    respond_to do |format|
      if @agent_of_service.update(agent_of_service_params)
        format.html { redirect_to "/agent_of_services", notice: 'Se ha modificado el servicio del Agente correctamente' }
        format.json { render :show, status: :ok, location: @agent_of_service }
      else
        format.html { render :edit }
        format.json { render json: @agent_of_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agent_of_services/1
  # DELETE /agent_of_services/1.json
  def destroy
    @agent_of_service.destroy
    respond_to do |format|
      format.html { redirect_to agent_of_services_url, notice: 'Agent of service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def charge_agents
    haberes = import('app/assets/docs/csv/haberes.csv') do
      start_at_row 2
      delimited_by ";"
      [cat_prog, oficina, dni, nombre_completo, ley, agr, cat, hs_semanales, hs_c_guardia, clase, grado, jerarquia, resp_jerarquia, c_1, c_2, c_3, c_4, c_5, c_6, c_7, c_8, c_9, c_10, c_11, c_12, c_13, c_14, c_15, c_16, c_17, c_18, c_19, c_20, c_21, c_22, c_23, c_24, c_25, c_26, c_27, c_28, c_29, c_30, c_31, c_32, c_33, c_34, c_35, c_36, c_37, c_38, c_39, c_40, c_41, c_42, c_43, c_44, c_45, c_46, c_47, c_48, c_49, c_50, c_51, c_52, c_53, c_54, c_55, c_56, c_57, c_58, c_59, c_60, c_61, c_62, c_63, c_64, c_65, c_66, c_67, c_68, c_69, c_70, c_71, c_72, c_73, c_74, c_75, c_76, c_77, c_78, c_79, c_80, c_81, c_82, c_83, c_84, c_85, c_86, c_87, c_88, c_89, c_90, c_91, c_92, c_93, c_94, c_95, c_96, c_97, c_98, c_99, c_100, c_101, c_102, c_103, c_104, c_105, c_106, c_107, c_108, c_109, c_110, c_111, c_112, c_113, c_114, c_115, c_116, c_117, c_118, c_119, c_120, c_121, c_122, c_123, c_124, c_125, c_126, c_127, c_128, c_129, c_130, c_131, c_132, c_133, c_134, c_135, c_136, c_137, c_138, c_139, c_140, c_141, c_142, c_143, c_144, c_145, c_146, c_147, c_148, c_149, c_150, c_151, c_152, c_153, c_154, c_155, c_156, c_157, c_158, c_159, c_160, c_161, c_162, c_163, c_164, c_165, c_166, c_167, c_168, c_169, c_170, c_171, c_172, c_173, c_174, c_175, c_176, c_177, c_178]
    end
    
    titulos_a = []
    haberes.each_with_index do |  h_agente, i|
      if i.zero?                              # Si es la primer linea del excel
        titulos_a = h_agente.to_a             # Convierto la fila en un arreglo
          #h_titulos = titulos_a.slice(13..-1)   # Saco la parte de los conceptos

      else
        #--- Formato de DNI
        dni = h_agente.dni[3,8].to_i
        #--- Recupero el agente si existe
        agente = Agent.where(dni: dni).first
        if agente.nil?
          #--- Si no existe lo creo y cargo sus información
          agente = Agent.new
          agente.dni = dni
          
        end
        agente.fullname = h_agente.nombre_completo  
        # --- Hour Regime
        cg = false
        agente.hour_regime = HourRegime.where(hours:h_agente.hs_semanales, with_guard:cg).first

        # --- position
        position = Position.where(grouping:h_agente.agr, clase:h_agente.clase, grade:h_agente.grado).first
        if h_agente.jerarquia != "0"
          position_j = Position.where(grouping:h_agente.agr, clase:h_agente.clase, hierarchy:h_agente.jerarquia).first
          if !position_j.nil? || !position.nil?
            if position_j.category.code > position.category.code
              position = position_j
            end  
            agente.position = position
          end
          
        end
        

        # --- Otro datos
        agente.functional_dedication = !h_agente[titulos_a.index("1119")].nil?
        agente.exclusive_dedication = !h_agente[titulos_a.index("1165")].nil?
        agente.unhealthy_work = !h_agente[titulos_a.index("1132")].nil?

         # --- Tipo de Agente
        # ----- Cat 19 <=               "Mensualizado P/G"
        # ----- Concepto 1256 <=        "Operador de Apoyo"
        # ----- Concepto 1157<375 <=        "Médico Residente"
        # ----- Cualquier otro Caso <=  "Personal de Planta"
        agente.agent_type = AgentType.where(code: 1).first # Personal de planta
        if (h_agente.cat == "19")
          agente.agent_type = AgentType.where(code: 2).first # Mensualizado para guardia
        end
        if (!h_agente[titulos_a.index("1256")].nil?)
          agente.agent_type = AgentType.where(code: 3).first
        end
        if (!h_agente[titulos_a.index("1157")].nil?)
          if (h_agente[titulos_a.index("1157")].to_i < 375)
            agente.agent_type = AgentType.where(code: 4).first
          end
        end

        if agente.save
          # ---  Add to Service+
          aos = AgentOfService.where(agent: agente).first
          if aos.nil?
            aos = AgentOfService.new
            sod = ServiceOfDependence.where(service: Service.first, dependence: Dependence.where(code: h_agente.oficina)).first
            aos.agent = agente
            aos.service_of_dependence = sod
            aos.description = "Carga Inicial"
            aos.save
          end
        end
      end
    end
  end

  def agents_from_service_of_dependence
    id_sod = params[:id]
    agent_type = AgentType.where(code:params[:type].to_i).first
    sod = ServiceOfDependence.where(id: id_sod).first
    aos = sod.agent_of_services
    if agent_type.nil?
      agents = Agent.where(id: aos.pluck(:agent_id))
    else
      agents_mpg = Agent.where(id: aos.pluck(:agent_id), agent_type:agent_type)
      list = []        
      agents_mpg.each do |agent|
        m_f_g_h =  MonthlyForGuardHour.where(agent:agent).first
        if !m_f_g_h.nil?
          if m_f_g_h.with_coverage?
            list << m_f_g_h.agent.id
          end
        end
      end
      agents = Agent.where(id: list)
    end
    respond_to do |format|
      format.json  { render :json => {:agents => agents}}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_of_service
      @agent_of_service = AgentOfService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_of_service_params
      params.require(:agent_of_service).permit(:agent_id, :service_of_dependence_id, :function, :description)
    end
  
end

