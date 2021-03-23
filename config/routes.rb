Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :farms, only: [:index, :show ] do
    resources :products, only: [:show]
  end
  resources :orders, only: [:index, :new, :create]
  get 'listFarms', to: 'farms#listFarms'
  resources :favorites, only: [:index, :create, :destroy]
end
