Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get 'my-dragons', to: 'pages#my_dragons'

  resources :dragons do
    resources :booking, only: %i[index show new create]
  end
end
