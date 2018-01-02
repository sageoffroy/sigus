RailsAdmin.config do |config|

  require "rails_admin/application_controller"

  module RailsAdmin
    # Monkey patch RailsAdmin::ApplicationController in order to make rails_admin live reload its initializers.
    class ApplicationController < Config.parent_controller.constantize
      before_action :reload_rails_admin, if: :rails_admin_path?

      private

      def reload_rails_admin
        # TODO: specify all your models for which you want autoloading to be applied
        models = %W(Model1 Model2)
        models.each do |m|
          RailsAdmin::Config.reset_model(m)
        end
        RailsAdmin::Config::Actions.reset

        # It may be a good idea to have rails_admin initializers split across multiple files,
        # especially if you configure models inside initializers too (I myself prefer this way).
        # So, if yes, you should uncomment (and maybe edit) the following line:
        #
        # Dir[Rails.root.join('config', 'initializers', 'rails_admin', '*.rb')].each { |file| load file }
        #
        # And then don't forget to extend `config.autoload_paths` inside `config/application.rb`,
        # as this method will be only called in development mode.
        
        load(Rails.root.join('config', 'initializers', 'rails_admin.rb'))
      end

      def rails_admin_path?
        controller_path =~ /rails_admin/ && Rails.env.development?
      end
    end
  end

  ### Popular gems integration

  ## == Devise ==
  config.authenticate_with do
    warden.authenticate! scope: :user
  end
  config.current_user_method(&:current_user)

  ## == Cancan ==
   config.authorize_with :cancan

  ## == Pundit ==
  # config.authorize_with :pundit

  ## == PaperTrail ==
  # config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  ### More at https://github.com/sferik/rails_admin/wiki/Base-configuration

  ## == Gravatar integration ==
  ## To disable Gravatar integration in Navigation Bar set to false
  # config.show_gravatar = true

  config.actions do
    dashboard                     # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
