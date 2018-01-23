class MpgControlsController < ApplicationController
  before_action :set_mpg_control, only: [:show, :edit, :update, :destroy]

  # GET /mpg_controls
  # GET /mpg_controls.json
  def index
    @mpg_controls = MpgControl.all
  end

  # GET /mpg_controls/1
  # GET /mpg_controls/1.json
  def show
  end

  # GET /mpg_controls/new
  def new
    @mpg_control = MpgControl.new
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    agent_type = AgentType.where(code:2).first
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id), agent_type:agent_type)

    @agents.each do |agent|
      h_g_a =  MonthlyForGuardHour.where(agent:agent).first
      if h_g_a.nil?
        @mpg_control.mpg_control_details.build(agent:agent, hs_guard:0, hs_umu:0)
      else
        @mpg_control.mpg_control_details.build(agent:agent, hs_guard:h_g_a.hs_total_1, hs_umu:h_g_a.hs_total_2)
      end
      
    end 
    
  end

  # GET /mpg_controls/1/edit
  def edit
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  # POST /mpg_controls
  # POST /mpg_controls.json
  def create
    @mpg_control = MpgControl.new(mpg_control_params)

    respond_to do |format|
      if @mpg_control.save
        format.html { redirect_to @mpg_control, notice: 'Mpg control was successfully created.' }
        format.json { render :show, status: :created, location: @mpg_control }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
        format.html { render :new }
        format.json { render json: @mpg_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mpg_controls/1
  # PATCH/PUT /mpg_controls/1.json
  def update
    respond_to do |format|
      if @mpg_control.update(mpg_control_params)
        format.html { redirect_to @mpg_control, notice: 'Mpg control was successfully updated.' }
        format.json { render :show, status: :ok, location: @mpg_control }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
        format.html { render :edit }
        format.json { render json: @mpg_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mpg_controls/1
  # DELETE /mpg_controls/1.json
  def destroy
    @mpg_control.destroy
    respond_to do |format|
      format.html { redirect_to mpg_controls_url, notice: 'Mpg control was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mpg_control
      @mpg_control = MpgControl.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mpg_control_params
      params.require(:mpg_control).permit(:year, :month, :service_of_dependence_id, mpg_control_details_attributes: [:id, :url, :_destroy, :agent_id, :hs_guard,:hs_umu])
    end
end
