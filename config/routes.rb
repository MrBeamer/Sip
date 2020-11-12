Rails.application.routes.draw do
  get 'doses/index'
  get 'doses/show'
  get 'doses/new'
  get 'doses/create'
  get 'doses/destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cocktails
end
