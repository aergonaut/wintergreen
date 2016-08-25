Rails.application.routes.draw do
  resources :sessions, only: [:new, :create, :destroy]

  get '/auth/:provider/callback' => 'sessions#create'
end
