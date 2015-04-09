Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    resources :routines do 
      resources :completes, shallow: true
    end 
  end

  root "horses#index"
  get "/my_horses" => "horses#mine"

  resources :horses do
    resources :routines, shallow: true do 
      resources :completes, shallow: true
    end
  end

end
