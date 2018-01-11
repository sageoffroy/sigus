class AdditionalsController < ApplicationController
  before_action :set_additional, only: [:show, :edit, :update, :destroy]

  # GET /additionals
  # GET /additionals.json
  def index
    @additionals = Additional.all
  end

  # GET /additionals/1
  # GET /additionals/1.json
  def show
    @additional_details = AdditionalDetail.where(additional:@additional)
  end

  # GET /additionals/new
  def new
    @additional = Additional.new
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  # GET /additionals/1/edit
  def edit
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  # POST /additionals
  # POST /additionals.json
  def create
    @additional = Additional.new(additional_params)

    respond_to do |format|
      if @additional.save
        format.html { redirect_to @additional, notice: 'Additional was successfully created.' }
        format.json { render :show, status: :created, location: @additional }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
        format.html { render :new }
        format.json { render json: @additional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additionals/1
  # PATCH/PUT /additionals/1.json
  def update
    respond_to do |format|
      if @additional.update(additional_params)
        format.html { redirect_to @additional, notice: 'Additional was successfully updated.' }
        format.json { render :show, status: :ok, location: @additional }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
        format.html { render :edit }
        format.json { render json: @additional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additionals/1
  # DELETE /additionals/1.json
  def destroy
    @additional.destroy
    respond_to do |format|
      format.html { redirect_to additionals_url, notice: 'Additional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional
      @additional = Additional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_params
      params.require(:additional).permit(:year, :month, :service_of_dependence_id, additional_details_attributes: [:id, :url, :_destroy, :agent_id, :franco_movil, :turno_nocturno_fijo, :tarea_en_terreno, rotative_turn_attributes: [:id, :url, :_destroy, :days, :is_complete]])
    end
end
