class HistoricalGuardAgentsController < ApplicationController
  before_action :set_historical_guard_agent, only: [:show, :edit, :update, :destroy]

  # GET /historical_guard_agents
  # GET /historical_guard_agents.json
  def index
    @historical_guard_agents = HistoricalGuardAgent.all
  end

  # GET /historical_guard_agents/1
  # GET /historical_guard_agents/1.json
  def show
  end

  # GET /historical_guard_agents/new
  def new
    @historical_guard_agent = HistoricalGuardAgent.new
  end

  # GET /historical_guard_agents/1/edit
  def edit
  end

  # POST /historical_guard_agents
  # POST /historical_guard_agents.json
  def create
    @historical_guard_agent = HistoricalGuardAgent.new(historical_guard_agent_params)

    respond_to do |format|
      if @historical_guard_agent.save
        format.html { redirect_to @historical_guard_agent, notice: 'Historical guard agent was successfully created.' }
        format.json { render :show, status: :created, location: @historical_guard_agent }
      else
        format.html { render :new }
        format.json { render json: @historical_guard_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /historical_guard_agents/1
  # PATCH/PUT /historical_guard_agents/1.json
  def update
    respond_to do |format|
      if @historical_guard_agent.update(historical_guard_agent_params)
        format.html { redirect_to @historical_guard_agent, notice: 'Historical guard agent was successfully updated.' }
        format.json { render :show, status: :ok, location: @historical_guard_agent }
      else
        format.html { render :edit }
        format.json { render json: @historical_guard_agent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /historical_guard_agents/1
  # DELETE /historical_guard_agents/1.json
  def destroy
    @historical_guard_agent.destroy
    respond_to do |format|
      format.html { redirect_to historical_guard_agents_url, notice: 'Historical guard agent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_historical_guard_agent
      @historical_guard_agent = HistoricalGuardAgent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def historical_guard_agent_params
      params.require(:historical_guard_agent).permit(:agent_id, :month, :year, :concept_1, :hs_total_1, :concept_2, :hs_total_2)
    end
end
