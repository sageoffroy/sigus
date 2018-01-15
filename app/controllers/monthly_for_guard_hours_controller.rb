class MonthlyForGuardHoursController < ApplicationController
  before_action :set_monthly_for_guard_hour, only: [:show, :edit, :update, :destroy]

  # GET /monthly_for_guard_hours
  # GET /monthly_for_guard_hours.json
  def index
    @monthly_for_guard_hours = MonthlyForGuardHour.all
  end

  # GET /monthly_for_guard_hours/1
  # GET /monthly_for_guard_hours/1.json
  def show
  end

  # GET /monthly_for_guard_hours/new
  def new
    @monthly_for_guard_hour = MonthlyForGuardHour.new
  end

  # GET /monthly_for_guard_hours/1/edit
  def edit
  end

  # POST /monthly_for_guard_hours
  # POST /monthly_for_guard_hours.json
  def create
    @monthly_for_guard_hour = MonthlyForGuardHour.new(monthly_for_guard_hour_params)

    respond_to do |format|
      if @monthly_for_guard_hour.save
        format.html { redirect_to @monthly_for_guard_hour, notice: 'Monthly for guard hour was successfully created.' }
        format.json { render :show, status: :created, location: @monthly_for_guard_hour }
      else
        format.html { render :new }
        format.json { render json: @monthly_for_guard_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monthly_for_guard_hours/1
  # PATCH/PUT /monthly_for_guard_hours/1.json
  def update
    respond_to do |format|
      if @monthly_for_guard_hour.update(monthly_for_guard_hour_params)
        format.html { redirect_to @monthly_for_guard_hour, notice: 'Monthly for guard hour was successfully updated.' }
        format.json { render :show, status: :ok, location: @monthly_for_guard_hour }
      else
        format.html { render :edit }
        format.json { render json: @monthly_for_guard_hour.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monthly_for_guard_hours/1
  # DELETE /monthly_for_guard_hours/1.json
  def destroy
    @monthly_for_guard_hour.destroy
    respond_to do |format|
      format.html { redirect_to monthly_for_guard_hours_url, notice: 'Monthly for guard hour was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monthly_for_guard_hour
      @monthly_for_guard_hour = MonthlyForGuardHour.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monthly_for_guard_hour_params
      params.require(:monthly_for_guard_hour).permit(:agent_id, :hs_semana, :gs_semana, :hs_sabado, :hs_domingo , :hs_total_1, :hs_total_2, :concept_1_id, :concept_2_id)
    end
end
