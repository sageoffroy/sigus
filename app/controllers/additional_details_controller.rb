class AdditionalDetailsController < ApplicationController
  before_action :set_additional_detail, only: [:show, :edit, :update, :destroy]

  # GET /additional_details
  # GET /additional_details.json
  def index
    @additional_details = AdditionalDetail.all
  end

  # GET /additional_details/1
  # GET /additional_details/1.json
  def show
  end

  # GET /additional_details/new
  def new
    @additional_detail = AdditionalDetail.new
  end

  # GET /additional_details/1/edit
  def edit
  end

  # POST /additional_details
  # POST /additional_details.json
  def create
    @additional_detail = AdditionalDetail.new(additional_detail_params)

    respond_to do |format|
      if @additional_detail.save
        format.html { redirect_to @additional_detail, notice: 'Additional detail was successfully created.' }
        format.json { render :show, status: :created, location: @additional_detail }
      else
        format.html { render :new }
        format.json { render json: @additional_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /additional_details/1
  # PATCH/PUT /additional_details/1.json
  def update
    respond_to do |format|
      if @additional_detail.update(additional_detail_params)
        format.html { redirect_to @additional_detail, notice: 'Additional detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @additional_detail }
      else
        format.html { render :edit }
        format.json { render json: @additional_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /additional_details/1
  # DELETE /additional_details/1.json
  def destroy
    @additional_detail.destroy
    respond_to do |format|
      format.html { redirect_to additional_details_url, notice: 'Additional detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_additional_detail
      @additional_detail = AdditionalDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def additional_detail_params
      params.require(:additional_detail).permit(:agent_id, :rotative_turn_id, :franco_movil, :turno_nocturno_fijo, :tarea_en_terreno)
    end
end
