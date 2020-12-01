Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :missions, only: [:index, :new, :create, :update, :edit, :destroy ]
  resources :habits, only: [:index, :new, :create, :update, :edit, :destroy]
  resources :missions, only: [:index, :new, :create, :update, :edit, :destroy ]
  resources :habits, only: [:index, :new, :create, :update, :edit, :destroy]
  resources :missions, only: [:index, :new, :create, :update, :edit, :destroy ]
  resources :habits, only: [:index, :new, :create, :update, :edit, :destroy]
  resources :missions, only: [:index, :new, :create, :update, :edit, :destroy ]
  resources :habits, only: [:index, :new, :create, :update, :edit, :destroy]
end
