class ServiceOfDependencesController < ApplicationController
  before_action :set_service_of_dependence, only: [:show, :edit, :update, :destroy]

  # GET /service_of_dependences
  # GET /service_of_dependences.json
  def index
    @service_of_dependences = ServiceOfDependence.all
  end

  # GET /service_of_dependences/1
  # GET /service_of_dependences/1.json
  def show
  end

  # GET /service_of_dependences/new
  def new
    @service_of_dependence = ServiceOfDependence.new
  end

  # GET /service_of_dependences/1/edit
  def edit
  end

  # POST /service_of_dependences
  # POST /service_of_dependences.json
  def create
    @service_of_dependence = ServiceOfDependence.new(service_of_dependence_params)

    respond_to do |format|
      if @service_of_dependence.save
        format.html { redirect_to @service_of_dependence, notice: 'Service of dependence was successfully created.' }
        format.json { render :show, status: :created, location: @service_of_dependence }
      else
        format.html { render :new }
        format.json { render json: @service_of_dependence.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /service_of_dependences/1
  # PATCH/PUT /service_of_dependences/1.json
  def update
    respond_to do |format|
      if @service_of_dependence.update(service_of_dependence_params)
        format.html { redirect_to @service_of_dependence, notice: 'Service of dependence was successfully updated.' }
        format.json { render :show, status: :ok, location: @service_of_dependence }
      else
        format.html { render :edit }
        format.json { render json: @service_of_dependence.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /service_of_dependences/1
  # DELETE /service_of_dependences/1.json
  def destroy
    @service_of_dependence.destroy
    respond_to do |format|
      format.html { redirect_to service_of_dependences_url, notice: 'Service of dependence was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service_of_dependence
      @service_of_dependence = ServiceOfDependence.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def service_of_dependence_params
      params.require(:service_of_dependence).permit(:service_id, :dependence_id, :description)
    end
end
