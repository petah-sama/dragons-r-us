Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'my-dragons', to: 'pages#my_dragons'
  get 'my-bookings', to: 'pages#my_bookings'

  resources :dragons do
    resources :bookings, only: :create
  end
  resources :bookings, only: :destroy
end
