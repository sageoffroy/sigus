class ObservationDescriptionsController < ApplicationController
  before_action :set_observation_description, only: [:show, :edit, :update, :destroy]

  # GET /observation_descriptions
  # GET /observation_descriptions.json
  def index
    @observation_descriptions = ObservationDescription.all
  end

  # GET /observation_descriptions/1
  # GET /observation_descriptions/1.json
  def show
  end

  # GET /observation_descriptions/new
  def new
    @observation_description = ObservationDescription.new
  end

  # GET /observation_descriptions/1/edit
  def edit
  end

  # POST /observation_descriptions
  # POST /observation_descriptions.json
  def create
    @observation_description = ObservationDescription.new(observation_description_params)

    respond_to do |format|
      if @observation_description.save
        format.html { redirect_to @observation_description, notice: 'Observation description was successfully created.' }
        format.json { render :show, status: :created, location: @observation_description }
      else
        format.html { render :new }
        format.json { render json: @observation_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /observation_descriptions/1
  # PATCH/PUT /observation_descriptions/1.json
  def update
    respond_to do |format|
      if @observation_description.update(observation_description_params)
        format.html { redirect_to @observation_description, notice: 'Observation description was successfully updated.' }
        format.json { render :show, status: :ok, location: @observation_description }
      else
        format.html { render :edit }
        format.json { render json: @observation_description.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /observation_descriptions/1
  # DELETE /observation_descriptions/1.json
  def destroy
    @observation_description.destroy
    respond_to do |format|
      format.html { redirect_to observation_descriptions_url, notice: 'Observation description was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_observation_description
      @observation_description = ObservationDescription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def observation_description_params
      params.require(:observation_description).permit(:code, :description)
    end
end
