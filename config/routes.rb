Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :currencies, only: :index
  resources :currency_rates, only: %i[index create]
  resources :specific_currency_rates, only: %i[index create]
  resources :convert_currency, only: %i[new create show]
  resources :historical_exchange_rate, only: %i[show]

  root to: 'currencies#index'
end
