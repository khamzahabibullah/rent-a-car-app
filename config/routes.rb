Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :cars do
    resources :bookings, only: [:new, :create]
  end
  get '/my_bookings', to: 'bookings#my_bookings', as: 'my_bookings'
  resources :bookings, only: :destroy
end
