class RotativeTurnsController < ApplicationController
  before_action :set_rotative_turn, only: [:show, :edit, :update, :destroy]

  # GET /rotative_turns
  # GET /rotative_turns.json
  def index
    @rotative_turns = RotativeTurn.all
  end

  # GET /rotative_turns/1
  # GET /rotative_turns/1.json
  def show
  end

  # GET /rotative_turns/new
  def new
    @rotative_turn = RotativeTurn.new
  end

  # GET /rotative_turns/1/edit
  def edit
  end

  # POST /rotative_turns
  # POST /rotative_turns.json
  def create
    @rotative_turn = RotativeTurn.new(rotative_turn_params)

    respond_to do |format|
      if @rotative_turn.save
        format.html { redirect_to @rotative_turn, notice: 'Rotative turn was successfully created.' }
        format.json { render :show, status: :created, location: @rotative_turn }
      else
        format.html { render :new }
        format.json { render json: @rotative_turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rotative_turns/1
  # PATCH/PUT /rotative_turns/1.json
  def update
    respond_to do |format|
      if @rotative_turn.update(rotative_turn_params)
        format.html { redirect_to @rotative_turn, notice: 'Rotative turn was successfully updated.' }
        format.json { render :show, status: :ok, location: @rotative_turn }
      else
        format.html { render :edit }
        format.json { render json: @rotative_turn.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rotative_turns/1
  # DELETE /rotative_turns/1.json
  def destroy
    @rotative_turn.destroy
    respond_to do |format|
      format.html { redirect_to rotative_turns_url, notice: 'Rotative turn was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rotative_turn
      @rotative_turn = RotativeTurn.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def rotative_turn_params
      params.require(:rotative_turn).permit(:days, :is_complete)
    end
end
