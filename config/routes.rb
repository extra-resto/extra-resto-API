Rails.application.routes.draw do
  
  resources :candidatures
  Rails.application.routes.default_url_options[:host] = 'localhost:3000'
    namespace :api, defaults: { format: :json } do
      resources :users, only: %w[show] 
      resources :businesses
      resources :events
      resources :jobs
    end

    devise_for :users,
      defaults: { format: :json },
      path: '',
      path_names: {
        sign_in: 'api/login',
        sign_out: 'api/logout',
        registration: 'api/signup'
      },
      controllers: {
        sessions: 'sessions',
        registrations: 'registrations'
      }
end
