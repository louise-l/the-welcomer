Rails.application.routes.draw do

  root to: 'pages#home'

  devise_for :users

  resources :companies, param: :name, only: [:show] do
    get 'notifications', to: 'notifications#index', as: 'notifications'
    patch 'notifications/:id', to: 'notifications#update', as: 'edit_notification'
    #Libraries
    resources :libraries
    #Messagerie

    get '/conversations', to: 'conversations#index', as: 'conversations'
    get '/conversations/window/:name', to: 'conversations#window', as: 'window'
    get '/conversations/:id', to: 'conversations#show', as: 'conversation'


    # company_conversations GET    /companies/:company_name/conversations(.:format)                                         conversations#index
    # company_conversation GET    /companies/:company_name/conversations/:id(.:format)                                     conversations#show


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

    #Personal Libraries
    get 'personal_libraries/:user_id', to: 'personal_libraries#index', as: 'personal_libraries'
    get 'personal_libraries/:user_id/:id', to: 'personal_libraries#show', as: 'personal_library'
    post 'personal_libraries/:user_id', to: 'personal_libraries#create'
    get 'personal_libraries/:user_id/new', to: 'personal_libraries#new', as: 'new_personal_library'
    get 'personal_libraries/:user_id/:id/edit', to: 'personal_libraries#edit', as: 'edit_personal_library'
    patch 'personal_libraries/:user_id/:id', to: 'personal_libraries#update'
    delete 'personal_libraries/:user_id/:id', to: 'personal_libraries#destroy'

    #profiles status
    resources :profiles, only: [:new, :create]
    get '/users/:user_id/role/edit', to: 'profiles#edit', as: 'edit_user_role'
    patch '/users/:user_id', to: 'profiles#update', as: 'company_user_path'
    get '/users/:id', to: 'profiles#show', as: 'user'


    #Profiles
    resources :meetings do
      resources :participates, only: [:new, :create, :destroy, :show]
    end


  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
