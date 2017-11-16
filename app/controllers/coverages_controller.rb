class CoveragesController < ApplicationController
  before_action :set_coverage, only: [:show, :edit, :update, :destroy]

  # GET /coverages
  # GET /coverages.json
  def index
    @coverages = Coverage.all
  end

  # GET /coverages/1
  # GET /coverages/1.json
  def show
  end

  # GET /coverages/new
  def new
    @coverage = Coverage.new
  end

  # GET /coverages/1/edit
  def edit
  end

  # POST /coverages
  # POST /coverages.json
  def create
    @coverage = Coverage.new(coverage_params)

    respond_to do |format|
      if @coverage.save
        format.html { redirect_to @coverage, notice: 'Coverage was successfully created.' }
        format.json { render :show, status: :created, location: @coverage }
      else
        format.html { render :new }
        format.json { render json: @coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /coverages/1
  # PATCH/PUT /coverages/1.json
  def update
    respond_to do |format|
      if @coverage.update(coverage_params)
        format.html { redirect_to @coverage, notice: 'Coverage was successfully updated.' }
        format.json { render :show, status: :ok, location: @coverage }
      else
        format.html { render :edit }
        format.json { render json: @coverage.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /coverages/1
  # DELETE /coverages/1.json
  def destroy
    @coverage.destroy
    respond_to do |format|
      format.html { redirect_to coverages_url, notice: 'Coverage was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coverage
      @coverage = Coverage.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def coverage_params
      params.require(:coverage).permit(:service_of_dependence_id, :hs_lunes_diurnas, :hs_lunes_nocturnas, :hs_martes_diurnas, :hs_martes_nocturnas, :hs_miercoles_diurnas, :hs_miercoles_nocturnas, :hs_jueves_diurnas, :hs_jueves_nocturnas, :hs_viernes_diurnas, :hs_viernes_nocturnas, :hs_sabado, :hs_domingo)
    end
end
