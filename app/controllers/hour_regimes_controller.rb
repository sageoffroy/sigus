class HourRegimesController < ApplicationController
  before_action :set_hour_regime, only: [:show, :edit, :update, :destroy]

  # GET /hour_regimes
  # GET /hour_regimes.json
  def index
    @hour_regimes = HourRegime.all
  end

  # GET /hour_regimes/1
  # GET /hour_regimes/1.json
  def show
  end

  # GET /hour_regimes/new
  def new
    @hour_regime = HourRegime.new
  end

  # GET /hour_regimes/1/edit
  def edit
  end

  # POST /hour_regimes
  # POST /hour_regimes.json
  def create
    @hour_regime = HourRegime.new(hour_regime_params)

    respond_to do |format|
      if @hour_regime.save
        format.html { redirect_to @hour_regime, notice: 'Hour regime was successfully created.' }
        format.json { render :show, status: :created, location: @hour_regime }
      else
        format.html { render :new }
        format.json { render json: @hour_regime.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hour_regimes/1
  # PATCH/PUT /hour_regimes/1.json
  def update
    respond_to do |format|
      if @hour_regime.update(hour_regime_params)
        format.html { redirect_to @hour_regime, notice: 'Hour regime was successfully updated.' }
        format.json { render :show, status: :ok, location: @hour_regime }
      else
        format.html { render :edit }
        format.json { render json: @hour_regime.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hour_regimes/1
  # DELETE /hour_regimes/1.json
  def destroy
    @hour_regime.destroy
    respond_to do |format|
      format.html { redirect_to hour_regimes_url, notice: 'Hour regime was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hour_regime
      @hour_regime = HourRegime.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hour_regime_params
      params.require(:hour_regime).permit(:hours, :with_guard, :description)
    end
end
