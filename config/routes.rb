Rails.application.routes.draw do
  devise_for :users
  root to: 'cocktails#home'
  resources :cocktails do
    resources :doses, only: [:new, :create]
  end
  resources :doses, only: [:destroy]
  get "profile", to: "cocktails#profile", as: :profile
end
