class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]
  
  def index
    if !current_user.nil?
      @faltantes_count = 15
      @validos_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Validado").count
      @rechazados_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Rechazado").count
      @aprob_por_director_count = @reports = Report.where(service_of_dependence: current_user.dependence.service_of_dependences, estado: "Aprob Director Hosp").count
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
end
