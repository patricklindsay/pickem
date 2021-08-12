Rails.application.routes.draw do
  root 'matches#index'

  resources :matches, only: [:index, :show]
  resources :guesses, only: [:create]
end
