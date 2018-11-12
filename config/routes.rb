Rails.application.routes.draw do
  root 'flights#index'
  get 'flights/show', to: 'flights#show'

  resources :bookings, only: [:new, :create, :show]
  resources :charges
end
