class ApplicationController < ActionController::Base
  
  include CanCan::ControllerAdditions
	
	protect_from_forgery with: :exception

	before_action :authenticate_user!
	before_action :reload_rails_admin, if: :rails_admin_path?

	

	rescue_from CanCan::AccessDenied do |exception|
   	flash[:error] = exception.message
   	redirect_to root_url
 	end

 	


 	private

  def reload_rails_admin
    models = %W(User UserProfile)
    models.each do |m|
      RailsAdmin::Config.reset_model(m)
    end
    RailsAdmin::Config::Actions.reset

    load("#{Rails.root}/config/initializers/rails_admin.rb")
  end

  def rails_admin_path?
    controller_path =~ /rails_admin/ && Rails.env.development?
  end

end
