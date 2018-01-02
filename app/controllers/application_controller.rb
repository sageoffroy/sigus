class ApplicationController < ActionController::Base
  
  include CanCan::ControllerAdditions
	before_action :authenticate_user!
	protect_from_forgery with: :exception

	rescue_from CanCan::AccessDenied do |exception|
   	flash[:error] = exception.message
   	redirect_to root_url
 	end
end
