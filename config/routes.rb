Rails.application.routes.draw do
  resources :rsvps, only:[:create, :update, :destroy]
  resources :events do
    resources :rsvps, only:[:create, :update, :destroy]
  end
  resources :users, only: [:new, :create, :edit, :update, :show] do
    resources :events, only: [:index, :new, :create, :edit, :update, :show, :destroy]
  end
  root 'sessions#home'
  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  post '/logout' => 'sessions#destroy'
  get '/logout' => 'sessions#logoff'
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
