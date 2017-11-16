Rails.application.routes.draw do
  resources :coverages
  resources :observation_descriptions
  resources :rotative_turns
  resources :day_hours
  resources :countries
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :categories
  resources :free_days
  resources :agent_observations
  resources :agent_types
  resources :job_functions
  resources :observations
  resources :report_details
  resources :reports
  resources :nationalities
  resources :hour_regimes
  resources :service_of_dependences
  resources :positions
  resources :dependences
  resources :agent_of_services
  resources :studies
  resources :services
  resources :agents
  devise_for :users
  root 'welcome#index'
  get 'agents_of_dependence/:dependence' => 'agents#agents_of_dependence'
  get 'services_of_dependence/' => 'services#services_of_dependence'
  post 'get_free_days/:year/:month' => 'free_days#get_free_days'
  post 'change_service/:id' => 'service_of_dependences#change_service'
  post 'charge_agents' => 'agent_of_services#charge_agents'
  post 'set_dependence/:id' => 'welcome#set_dependence'
  post 'update_agents_of_service/:id' => 'agent_of_services#agents_from_service_of_dependence'
  get 'dependence/' => 'dependences#dependence'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
