class JobFunctionsController < ApplicationController
  before_action :set_job_function, only: [:show, :edit, :update, :destroy]

  # GET /job_functions
  # GET /job_functions.json
  def index
    @job_functions = JobFunction.all
  end

  # GET /job_functions/1
  # GET /job_functions/1.json
  def show
  end

  # GET /job_functions/new
  def new
    @job_function = JobFunction.new
  end

  # GET /job_functions/1/edit
  def edit
  end

  # POST /job_functions
  # POST /job_functions.json
  def create
    @job_function = JobFunction.new(job_function_params)

    respond_to do |format|
      if @job_function.save
        format.html { redirect_to @job_function, notice: 'Job function was successfully created.' }
        format.json { render :show, status: :created, location: @job_function }
      else
        format.html { render :new }
        format.json { render json: @job_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /job_functions/1
  # PATCH/PUT /job_functions/1.json
  def update
    respond_to do |format|
      if @job_function.update(job_function_params)
        format.html { redirect_to @job_function, notice: 'Job function was successfully updated.' }
        format.json { render :show, status: :ok, location: @job_function }
      else
        format.html { render :edit }
        format.json { render json: @job_function.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_functions/1
  # DELETE /job_functions/1.json
  def destroy
    @job_function.destroy
    respond_to do |format|
      format.html { redirect_to job_functions_url, notice: 'Job function was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job_function
      @job_function = JobFunction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_function_params
      params.require(:job_function).permit(:name, :observation)
    end
end
