class AddiotionalsController < ApplicationController
  before_action :set_addiotional, only: [:show, :edit, :update, :destroy]

  # GET /addiotionals
  # GET /addiotionals.json
  def index
    @addiotionals = Addiotional.all
  end

  # GET /addiotionals/1
  # GET /addiotionals/1.json
  def show
  end

  # GET /addiotionals/new
  def new
    @addiotional = Addiotional.new
  end

  # GET /addiotionals/1/edit
  def edit
  end

  # POST /addiotionals
  # POST /addiotionals.json
  def create
    @addiotional = Addiotional.new(addiotional_params)

    respond_to do |format|
      if @addiotional.save
        format.html { redirect_to @addiotional, notice: 'Addiotional was successfully created.' }
        format.json { render :show, status: :created, location: @addiotional }
      else
        format.html { render :new }
        format.json { render json: @addiotional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addiotionals/1
  # PATCH/PUT /addiotionals/1.json
  def update
    respond_to do |format|
      if @addiotional.update(addiotional_params)
        format.html { redirect_to @addiotional, notice: 'Addiotional was successfully updated.' }
        format.json { render :show, status: :ok, location: @addiotional }
      else
        format.html { render :edit }
        format.json { render json: @addiotional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addiotionals/1
  # DELETE /addiotionals/1.json
  def destroy
    @addiotional.destroy
    respond_to do |format|
      format.html { redirect_to addiotionals_url, notice: 'Addiotional was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_addiotional
      @addiotional = Addiotional.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def addiotional_params
      params.require(:addiotional).permit(:agent_id, :year, :month, :description, :fm, :tnf, :tt, :rotative_turn_id)
    end
end
