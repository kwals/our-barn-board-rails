Rails.application.routes.draw do
  devise_for :users

  get "/test" => "horses#testaction"
  post '/test' => "routines#testaction"

  resources :horses do
    resources :routines, shallow: true do 
      resources :completes, shallow: true
    end
  end

end
