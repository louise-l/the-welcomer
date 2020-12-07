Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :companies, param: :name, only: [:show] do
    #Libraries
    resources :libraries
    #Messagerie
    resources :conversations, only: [:index, :show]
    resources :messages, only: [:new, :create]
    resources :users, only: [:index]
    # Dashboards
    resources :teams, only: [:index, :new, :create, :update, :edit, :destroy]
    get 'dashboards', to: 'dashboards#index', as: 'dashboards'
    get 'dashboards/:user_id', to: 'dashboards#show', as: 'dashboard'
    # Missions
    get '/users/:user_id/missions', to: 'habits#missions', as: 'user_missions'
    get '/users/:user_id/missions/new', to: 'missions#new', as: 'new_user_mission'
    post '/users/:user_id/missions', to: 'missions#create'
    get '/users/:user_id/missions/:id', to: 'missions#show', as: 'user_mission'
    get '/users/:user_id/missions/:id/edit', to: 'missions#edit', as: 'edit_user_mission'
    patch '/users/:user_id/missions/:id', to: 'missions#update'
    delete "/users/:user_id/missions/:id", to: 'missions#destroy'
    # Habits
    get '/users/:user_id/habits', to: 'habits#index', as: 'user_habits'
    get '/users/:user_id/habits/new', to: 'habits#new', as: 'new_user_habit'
    post '/users/:user_id/habits', to: 'habits#create'
    get '/users/:user_id/habits/:id', to: 'missions#show', as: 'user_habit'
    get '/users/:user_id/habits/:id/edit', to: 'habits#edit', as: 'edit_user_habit'
    patch '/users/:user_id/habits/:id', to: 'habits#update'
    delete '/users/:user_id/habits/:id', to: 'habits#destroy'
    #Teams
    resources :teams, only: [:index, :new, :create, :update, :edit, :destroy,:show]
    #Profiles
    resources :profiles, only: [:new, :create]
    resources :meetings do 
      resources :participates, only: [:new, :create, :destroy, :show]
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
