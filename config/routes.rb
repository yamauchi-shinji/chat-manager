Rails.application.routes.draw do
  devise_for :users
  get "users/show" => "users#show"
  patch "users/change" => "users#change"
  # get 'messages/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "rooms#index"
  resources :blacklist, only: [:new, :show, :create]
  resources :users, only: [:edit, :update]
  resources :rooms, only: [:new, :create, :destroy] do
    resources :messages, only: [:index, :create]
  end
end
