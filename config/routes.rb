Rails.application.routes.draw do
  resources :cryptos
  devise_for :users
  #get 'home/index'
  get 'home/about'
  get 'home/lookup'
  post "home/lookup" => 'home/lookup'
  root 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
