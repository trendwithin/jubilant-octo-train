Rails.application.routes.draw do
  devise_for :users

  root 'static_pages#home'

  devise_scope :user do # NB: Issue since 2016 on Github about devise_scope
    get 'login', to: 'devise/sessions#new'
    delete 'logout', to: 'devise/sessions#destroy'
  end

  require 'sidekiq/web'
  mount Sidekiq::Web => "/sidekiq"

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
