Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do
      resources :todos
    end
  end

  post '/login',    to: 'sessions#create'
  get '/logout',   to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  resources :users, only: [:create, :show, :index] do 
    resources :items, only: [:create, :show, :index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
