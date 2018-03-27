class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]
  
  def index
    if !current_user.nil?
      if current_user.period.nil?
        current_user.period = "12018"
        current_user.save
      end
      @month = current_user.period[0,6-current_user.period.size].to_i || 1
      @year = current_user.period[-4,4] || 2018
      @validos_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Validado", month: @month, year:@year).count
      @rechazados_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Rechazado", month: @month, year:@year).count
      @aprob_por_director_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Aprob Director Hosp", month: @month, year:@year).count
      @aprob_por_director_area_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Aprob Director Area", month: @month, year:@year).count
      @aprob_por_sueldo_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Aprob Sueldo", month: @month, year:@year).count
      @total_reportes = @validos_count +  @rechazados_count + @aprob_por_director_count + @aprob_por_director_area_count
    end
  end



  def set_dependence
  	id = params[:id]
  	current_user.dependence = Dependence.where(id: id).first
  	current_user.save
    respond_to do |format|
      format.json  { render :json => {:id => id, :name => current_user.dependence}}
    end
  end

  def set_period
    @month = params[:month]
    @year = params[:year]
    current_user.period = @month+@year
    current_user.save
    respond_to do |format|
      format.json  { render :json => {:id => 1, :name => "Algun Nombre"}}
    end
  end
end
