Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :chats, only: [:index]
  resources :items do
  resources :orders, only: [:index, :create]
 end
end
