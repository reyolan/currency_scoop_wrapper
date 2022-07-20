Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :currencies, only: :index
  resources :currency_rates, only: %i[index create], path: 'rates'
  resource :convert_currency, only: %i[new create show], controller: 'convert_currency', path: 'convert'
  resource :historical_exchange_rate, only: %i[show create new], controller: 'historical_exchange_rate', path: 'historical'

  root to: 'currencies#index'
end
