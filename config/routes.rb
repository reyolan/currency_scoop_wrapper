Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :currencies, only: :index
  resources :currency_rates, only: %i[index create]
  resource :convert_currency, only: %i[new create show], controller: 'convert_currency'
  resource :historical_exchange_rate, only: %i[show create new], controller: 'historical_exchange_rate'

  root to: 'currencies#index'
end
