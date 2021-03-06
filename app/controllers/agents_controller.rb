class AgentsController < ApplicationController
  before_action :set_agent, only: [:show, :edit, :update, :destroy]

  # GET /agents
  # GET /agents.json
  def index
    #if current_user.hospital? or current_user.director?
      dependence = current_user.dependence
      sod = dependence.service_of_dependences
      agents_of_service = AgentOfService.where(service_of_dependence: sod)
      @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
    #else
    #  @agents = Agent.all
    #end
  end

  # GET /agents/1
  # GET /agents/1.json
  def show
  end

  # GET /agents/new
  def new
    @agent = Agent.new
    @agent_of_service = AgentOfService.new
  end

  # GET /agents/1/edit
  def edit
  end

  # POST /agents
  # POST /agents.json
  def create
    @agent = Agent.new(agent_params)

    respond_to do |format|
      if @agent.save
        service_of_dependence = ServiceOfDependence.where(dependence:current_user.dependence, service:Service.where(name:"Sin Servicio Asignado")).first
        AgentOfService.create(agent: @agent, service_of_dependence:service_of_dependence)
        format.html { redirect_to @agent, notice: 'Agent was successfully created.' }
        format.json { render :show, status: :created, location: @agent }
      else
        format.html { render :new }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agents/1
  # PATCH/PUT /agents/1.json
  def update
    respond_to do |format|
      if @agent.update(agent_params)
        format.html { redirect_to @agent, notice: 'Agent was successfully updated.' }
        format.json { render :show, status: :ok, location: @agent }
      else
        format.html { render :edit }
        format.json { render json: @agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agents/1
  # DELETE /agents/1.json
  def destroy
    @agent.destroy
    respond_to do |format|
      format.html { redirect_to agents_url, notice: 'Agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def agents_of_dependence
    dependence = Dependence.where(code:params[:dependence]).first
    services_of_dependence = ServiceOfDependence.where(dependence:dependence)
    @agents_of_dependence = AgentOfService.where(service_of_dependence: services_of_dependence)
    respond_to do |format|
      format.html
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent
      @agent = Agent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_params
      params.require(:agent).permit(:dni, :fullname, :sex, :birthdate, :marital_status,:nationality_id, :email, :cell_phone, :position_id, :hour_regime_id, :study_id, :job_function_id, :exclusive_dedication, :functional_dedication, :rural_functional_dedication,:unhealthy_work, :agent_type)
    end
end
