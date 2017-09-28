class FreeDaysController < ApplicationController
  before_action :set_free_day, only: [:show, :edit, :update, :destroy]

  # GET /free_days
  # GET /free_days.json
  def index
    @free_days = FreeDay.all
  end

  # GET /free_days/1
  # GET /free_days/1.json
  def show
  end

  # GET /free_days/new
  def new
    @free_day = FreeDay.new
  end

  # GET /free_days/1/edit
  def edit
  end

  def get_free_days

    year = params[:year]
    month = params[:month]
    dt = DateTime.new(year.to_i, month.to_i)
    boy = dt.beginning_of_month
    eoy = dt.end_of_month

    free_days = FreeDay.where("day >= ? and day <= ?", boy, eoy).pluck(:day).map(&:day)
    


    
    respond_to do |format|
      format.json  { render :json => {:function => "get_free_days", :free_days => free_days}}
    end
  end


  # POST /free_days
  # POST /free_days.json
  def create
    @free_day = FreeDay.new(free_day_params)

    respond_to do |format|
      if @free_day.save
        format.html { redirect_to @free_day, notice: 'Free day was successfully created.' }
        format.json { render :show, status: :created, location: @free_day }
      else
        format.html { render :new }
        format.json { render json: @free_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /free_days/1
  # PATCH/PUT /free_days/1.json
  def update
    respond_to do |format|
      if @free_day.update(free_day_params)
        format.html { redirect_to @free_day, notice: 'Free day was successfully updated.' }
        format.json { render :show, status: :ok, location: @free_day }
      else
        format.html { render :edit }
        format.json { render json: @free_day.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /free_days/1
  # DELETE /free_days/1.json
  def destroy
    @free_day.destroy
    respond_to do |format|
      format.html { redirect_to free_days_url, notice: 'Free day was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_free_day
      @free_day = FreeDay.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def free_day_params
      params.require(:free_day).permit(:day, :description)
    end
end

