Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :farms, only: [:index, :show ] do
    resources :products, only: [:show]
    resources :orders, only: [:show, :index]
  end
  get 'listFarms', to: 'farms#listFarms'
end