class PercentageMonthsController < ApplicationController
  before_action :set_percentage_month, only: [:show, :edit, :update, :destroy]

  # GET /percentage_months
  # GET /percentage_months.json
  def index
    @percentage_months = PercentageMonth.all
  end

  # GET /percentage_months/1
  # GET /percentage_months/1.json
  def show
  end

  # GET /percentage_months/new
  def new
    @percentage_month = PercentageMonth.new
  end

  # GET /percentage_months/1/edit
  def edit
  end

  # POST /percentage_months
  # POST /percentage_months.json
  def create
    @percentage_month = PercentageMonth.new(percentage_month_params)

    respond_to do |format|
      if @percentage_month.save
        format.html { redirect_to @percentage_month, notice: 'Percentage month was successfully created.' }
        format.json { render :show, status: :created, location: @percentage_month }
      else
        format.html { render :new }
        format.json { render json: @percentage_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /percentage_months/1
  # PATCH/PUT /percentage_months/1.json
  def update
    respond_to do |format|
      if @percentage_month.update(percentage_month_params)
        format.html { redirect_to @percentage_month, notice: 'Percentage month was successfully updated.' }
        format.json { render :show, status: :ok, location: @percentage_month }
      else
        format.html { render :edit }
        format.json { render json: @percentage_month.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /percentage_months/1
  # DELETE /percentage_months/1.json
  def destroy
    @percentage_month.destroy
    respond_to do |format|
      format.html { redirect_to percentage_months_url, notice: 'Percentage month was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_percentage_month
      @percentage_month = PercentageMonth.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def percentage_month_params
      params.require(:percentage_month).permit(:mes, :valor)
    end
end
