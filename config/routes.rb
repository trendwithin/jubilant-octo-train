Rails.application.routes.draw do
  resources :five_period_leaders, except: [:show]
  resources :daily_high_lows, except: [:show]
  resources :stock_symbols, except: [:show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
