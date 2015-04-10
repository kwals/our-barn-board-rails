Rails.application.routes.draw do
  devise_for :users 

  namespace :api do
    devise_scope :user do 
      resources :sessions, only: [:create, :index]
    end
    resources :routines do 
      resources :completes, shallow: true
    end 
  end

  root "horses#index"
  get "/my_horses" => "horses#mine"
  # post "/api/sessions" => "api/sessions#create"

  resources :horses do
    resources :routines, shallow: true do 
      resources :completes, shallow: true
    end
  end

end
