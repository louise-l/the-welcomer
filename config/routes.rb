Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users


  get '/users/:user_id/missions', to: 'missions#index', as: 'user_missions'
  get '/users/:user_id/missions/new', to: 'missions#new', as: 'new_user_mission'
  post '/users/:user_id/missions', to: 'missions#create'
  get '/users/:user_id/missions/:id', to: 'missions#show', as: 'user_mission'
  get '/users/:user_id/missions/:id/edit', to: 'missions#edit', as: 'edit_user_mission'
  patch '/users/:user_id/missions/:id', to: 'missions#update'
  delete "/users/:user_id/missions/:id", to: 'missions#destroy'

  get '/users/:user_id/habits', to: 'habits#index', as: 'user_habits'
  get '/users/:user_id/habits/new', to: 'habits#new', as: 'new_user_habit'
  post '/users/:user_id/habits', to: 'habits#create'
  get '/users/:user_id/habits/:id', to: 'missions#show', as: 'user_habit'
  get '/users/:user_id/habits/:id/edit', to: 'habits#edit', as: 'edit_user_habit'
  patch '/users/:user_id/habits/:id', to: 'habits#update'
  delete '/users/:user_id/habits/:id', to: 'habits#destroy'


  resources :companies, param: :name, only: [:show] do
    resources :libraries
    resources :teams, only: [:index, :new, :create, :update, :edit, :destroy]
    member do
      get 'dashboard'
    end

    resources :profiles, only: [:new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
