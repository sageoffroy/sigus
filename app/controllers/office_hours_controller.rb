class OfficeHoursController < ApplicationController
  before_action :set_office_hour, only: [:show, :edit, :update, :destroy]

  # GET /office_hours
  # GET /office_hours.json
  def index
    @office_hours = OfficeHour.all
  end

  # GET /office_hours/1
  # GET /office_hours/1.json
  def show
  end

  # GET /office_hours/new
  def new
    @office_hour = OfficeHour.new
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  # GET /office_hours/1/edit
  def edit
    @services_of_dependence = current_user.dependence.service_of_dependences
    agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
    @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
  end

  # POST /office_hours
  # POST /office_hours.json
  def create
    @office_hour = OfficeHour.new(office_hour_params)

    respond_to do |format|
      if @office_hour.save
        format.html { redirect_to @office_hour, notice: 'Office hour was successfully created.' }
        format.json { render :show, status: :created, location: @office_hour }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
        format.html { render :new }
        format.json { render json: @office_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /office_hours/1
  # PATCH/PUT /office_hours/1.json
  def update
    respond_to do |format|
      if @office_hour.update(office_hour_params)
        format.html { redirect_to @office_hour, notice: 'Office hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @office_hour }
      else
        @services_of_dependence = current_user.dependence.service_of_dependences
        agents_of_service  = AgentOfService.where(service_of_dependence: @services_of_dependence)
        @agents = Agent.where(id: agents_of_service.pluck(:agent_id))
        format.html { render :edit }
        format.json { render json: @office_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /office_hours/1
  # DELETE /office_hours/1.json
  def destroy
    @office_hour.destroy
    respond_to do |format|
      format.html { redirect_to office_hours_url, notice: 'Office hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_office_hour
      @office_hour = OfficeHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def office_hour_params
      params.require(:office_hour).permit(:year, :month, :service_of_dependence, :total_hours, :description)
    end
end
