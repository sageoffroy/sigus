Rails.application.routes.draw do
  resources :free_days
  resources :agent_observations
  resources :agent_types
  resources :job_functions
  resources :observations
  resources :days_of_report_details
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
  get 'services_of_dependence/:dependence' => 'services#services_of_dependence'
  post 'get_free_days/:year/:month' => 'free_days#get_free_days'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
