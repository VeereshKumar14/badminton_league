Rails.application.routes.draw do
  root "leaderboard#index"

  resources :players, only: [:index, :new, :create, :destroy]
  resources :matches, only: [:new, :create, :index]
  get "leaderboard", to: "leaderboard#index"
end
