Rails.application.routes.draw do
  get 'reports/fresh_new_highs'

  get 'materialized_views/refresh_mat_views'
  post 'materialized_views/refresh', to: 'materialized_views#refresh_views'


  get 'market_monitor_google_sheets/index'

  root 'static_pages#home'

  get 'maintenance_and_errors/invalid_symbols'

  get 'data_for_charts/thirteen_pct'

  get 'charts/thirteen_percent'
  get 'charts/four_percent_index'

  devise_scope :user do
    get "/users/sign_up",  :to => 'static_pages#home'
    get 'login', to: 'devise/sessions#new'
  end
  devise_for :users, controllers: { registration: "registrations"}


  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"
  # mount PgHero::Engine, at: "pghero"
  # consider placement for Dev only

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

  namespace :charts do
    get 'view'
    get 'google_charts'
    get 'candlestick_charts'
    get 'barcharts'
    get 'new_leadership'
    get 'momentum_universe'
    get 'primary'
    get 'high_low'
    get 'daily_chart'
  end

  namespace :data_for_charts do
    get 'thirteen_percent'
    get 'monitor'
    get 'googs'
    get 'high_low_data'
    get 'stock_price_data'
    get 'candlestick_charts'
    get 'four_percent_index_chart_data'
    get 'new_leadership'
    get 'momentum_universe'
    get 'primary_ratio_chart_data'
    get 'daily_price_history'
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
