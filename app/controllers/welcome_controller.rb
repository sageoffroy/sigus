class WelcomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index]
  
  def index
  	
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
