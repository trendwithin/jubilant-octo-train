Rails.application.routes.draw do
  resources :daily_high_lows
  resources :stock_symbols
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
