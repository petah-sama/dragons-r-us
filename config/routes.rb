Rails.application.routes.draw do
  get 'bookings/new'
  get 'bookings/create'
  devise_for :users
  root to: 'pages#home'

  resources :dragons do
    resources :bookings, only: :create
  end
  resources :bookings, only: :delete
end
