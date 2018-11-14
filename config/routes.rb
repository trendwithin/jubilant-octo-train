Rails.application.routes.draw do
  resources :market_monitors
  root 'static_pages#home'

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  resources :tradeable_universes, except: [:show]
  resources :five_period_leaders, except: [:show]
  post 'daily_high_lows/upload', to: 'daily_high_lows#import_high_lows'
  resources :daily_high_lows, except: [:show]
  resources :stock_symbols, except: [:show]
  resources :price_histories, only: [:new, :index] do
    collection do
      post :fetch_price_history
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
