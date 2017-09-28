class AgentOfServicesController < ApplicationController
  before_action :set_agent_of_service, only: [:show, :edit, :update, :destroy]

  # GET /agent_of_services
  # GET /agent_of_services.json
  def index
    @agent_of_services = AgentOfService.all
  end

  # GET /agent_of_services/1
  # GET /agent_of_services/1.json
  def show
  end

  # GET /agent_of_services/new
  def new
    @agent_of_service = AgentOfService.new
  end

  # GET /agent_of_services/1/edit
  def edit
  end

  # POST /agent_of_services
  # POST /agent_of_services.json
  def create
    @agent_of_service = AgentOfService.new(agent_of_service_params)

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
        format.html { redirect_to @agent_of_service, notice: 'Agent of service was successfully updated.' }
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_agent_of_service
      @agent_of_service = AgentOfService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def agent_of_service_params
      params.require(:agent_of_service).permit(:agent_id, :service_of_dependence_id, :description)
    end
end
