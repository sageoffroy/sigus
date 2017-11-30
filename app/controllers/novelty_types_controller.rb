class NoveltyTypesController < ApplicationController
  before_action :set_novelty_type, only: [:show, :edit, :update, :destroy]

  # GET /novelty_types
  # GET /novelty_types.json
  def index
    @novelty_types = NoveltyType.all
  end

  # GET /novelty_types/1
  # GET /novelty_types/1.json
  def show
  end

  # GET /novelty_types/new
  def new
    @novelty_type = NoveltyType.new
  end

  # GET /novelty_types/1/edit
  def edit
  end

  # POST /novelty_types
  # POST /novelty_types.json
  def create
    @novelty_type = NoveltyType.new(novelty_type_params)

    respond_to do |format|
      if @novelty_type.save
        format.html { redirect_to @novelty_type, notice: 'Novelty type was successfully created.' }
        format.json { render :show, status: :created, location: @novelty_type }
      else
        format.html { render :new }
        format.json { render json: @novelty_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /novelty_types/1
  # PATCH/PUT /novelty_types/1.json
  def update
    respond_to do |format|
      if @novelty_type.update(novelty_type_params)
        format.html { redirect_to @novelty_type, notice: 'Novelty type was successfully updated.' }
        format.json { render :show, status: :ok, location: @novelty_type }
      else
        format.html { render :edit }
        format.json { render json: @novelty_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /novelty_types/1
  # DELETE /novelty_types/1.json
  def destroy
    @novelty_type.destroy
    respond_to do |format|
      format.html { redirect_to novelty_types_url, notice: 'Novelty type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_novelty_type
      @novelty_type = NoveltyType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def novelty_type_params
      params.require(:novelty_type).permit(:description)
    end
end
