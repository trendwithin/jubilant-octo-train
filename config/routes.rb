Rails.application.routes.draw do
  root 'static_pages#home'

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

  get "/404", to: "errors#not_found", via: :all
  get "/500", to: "errors#internal_server_error", via: :all

  resources :market_monitors
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
