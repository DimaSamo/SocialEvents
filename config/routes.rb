Rails.application.routes.draw do
  resources :events
  resources :users, only: [:new, :create, :edit, :update] do
    resources :events, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end
  root 'users#welcome'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
