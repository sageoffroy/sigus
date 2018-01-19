class MpgControlDetailsController < ApplicationController
  before_action :set_mpg_control_detail, only: [:show, :edit, :update, :destroy]

  # GET /mpg_control_details
  # GET /mpg_control_details.json
  def index
    @mpg_control_details = MpgControlDetail.all
  end

  # GET /mpg_control_details/1
  # GET /mpg_control_details/1.json
  def show
  end

  # GET /mpg_control_details/new
  def new
    @mpg_control_detail = MpgControlDetail.new
  end

  # GET /mpg_control_details/1/edit
  def edit
  end

  # POST /mpg_control_details
  # POST /mpg_control_details.json
  def create
    @mpg_control_detail = MpgControlDetail.new(mpg_control_detail_params)

    respond_to do |format|
      if @mpg_control_detail.save
        format.html { redirect_to @mpg_control_detail, notice: 'Mpg control detail was successfully created.' }
        format.json { render :show, status: :created, location: @mpg_control_detail }
      else
        format.html { render :new }
        format.json { render json: @mpg_control_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mpg_control_details/1
  # PATCH/PUT /mpg_control_details/1.json
  def update
    respond_to do |format|
      if @mpg_control_detail.update(mpg_control_detail_params)
        format.html { redirect_to @mpg_control_detail, notice: 'Mpg control detail was successfully updated.' }
        format.json { render :show, status: :ok, location: @mpg_control_detail }
      else
        format.html { render :edit }
        format.json { render json: @mpg_control_detail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mpg_control_details/1
  # DELETE /mpg_control_details/1.json
  def destroy
    @mpg_control_detail.destroy
    respond_to do |format|
      format.html { redirect_to mpg_control_details_url, notice: 'Mpg control detail was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mpg_control_detail
      @mpg_control_detail = MpgControlDetail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mpg_control_detail_params
      params.require(:mpg_control_detail).permit(:mpg_control_id, :agent_id, :hs_guard, :hs_umu, :description)
    end
end
