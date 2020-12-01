Rails.application.routes.draw do
  devise_for :users do
    resources :missions, only: [:index, :new, :create, :update, :edit, :destroy]
    resources :habits, only: [:index, :new, :create, :update, :edit, :destroy]
  end

  resources :companies, param: :name, only: [:show] do
    resources :libraries
  end
  
end
