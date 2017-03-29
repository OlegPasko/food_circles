# frozen_string_literal: true
Rails.application.routes.draw do
  devise_for :charities
  devise_for :venues
  get 'about_we/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sessions/omniauth_email', to: 'omniauth_ask_for_email#index', as: 'omniauth_email'
  put '/sessions/omniauth_email', to: 'omniauth_ask_for_email#submit', as: 'omniauth_email_submit'

  get 'reservation/used_email', to: 'reservation#used_email'
  get 'reservation/used', to: 'reservation#used'
  get 'reservation/active', to: 'reservation#active'
  get 'reservation/expired', to: 'reservation#expired'

  get 'payment/used', to: 'payment#used'
  get 'payment/active', to: 'payment#active'
  get 'payment/expired', to: 'payment#expired'
  get 'payment/inbound_mark_used', to: 'payment#inbound_mark_used'
  get 'payment/send_text', to: 'payment#send_text', as: 'payment_send_text'

  get 'signup', to: 'signup#index', as: 'signup'
  post 'signup', to: 'signup#create'
  resource :signup, controller: 'signup', only: [:index, :create]

  resource :inbox, controller: 'inbox', only: [:show, :create]

  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'

  get 'socialbutterflies/index'

  # match '/offers', to: 'offers#index', as: :offers
  resources :offers
  resources :categories
  get '/timeline', to: 'timeline#index', as: :timeline
  # match '/payment', to: 'payment#index', as: :payment
  post '/payment/stripe', to: 'payment#stripe', as: :stripe

  get 'user_signup/create'

  resources :stripe_payments, only: [:new, :create]

  get '/monthly_invoice', to: 'monthly_invoice#monthly_invoice', as: :invoice

  resources :chat, only: [:index, :show] do
    collection do
      get 'venues'
    end
  end

  resources :remind_list, only: [:create]
  resources :venues, only: [:show] do
    member do
      post 'subscribe'
      post 'unsubscribe'
      get 'subscribed'
    end
  end

  devise_scope :user do
    get '/registrations/new_twitter', to: 'users/omniauth_callbacks#new_twitter', as: 'new_twitter'
    post '/registrations/twitter_signup', to: 'users/omniauth_callbacks#twitter_signup', as: 'twitter_signup'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :payment_notifications

  get '/achievements', to: 'achievements#index', as: :achievements
  get '/achievements/best_donors', to: 'achievements#best_donors', as: :achievements_best_donors

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  resources :socialbutterflies
  resources :restaurants
  resources :companies
  resources :nonprofits
  resources :students
  resources :organizers
  resources :nominate

  scope 'mobi' do
    resources :payments
  end

  resource :settings, only: [:show, :update] do
    member do
      delete 'credit_card'
      put 'update_password'
      delete 'facebook_connection'
      delete 'twitter_connection'
    end
  end

  resource :newsletter, only: [] do
    member do
      post 'subscribe'
    end
  end
  resources :postcards, only: [:create]

  get '/app', to: 'app#index'
  get '/getVenue', to: 'app#getVenue'
  get '/getVenues', to: 'app#getVenues'
  get '/getCharities', to: 'app#getCharities'
  post '/confirm', to: 'app#confirm'
  post '/submit', to: 'app#submit'
  get '/newinfo', to: 'app#newinfo', as: :user_info
  get '/create_voucher', to: 'app#create_voucher'
  get '/voucher', to: 'app#voucher'

  # API

  namespace :api do
    get '/weekly_meals', to: 'weekly_meals#show', as: 'weekly_meals'

    post '/sessions/sign_in', to: 'sessions#sign_in'
    post '/sessions/sign_up', to: 'sessions#sign_up'

    put '/sessions/update', to: 'sessions#update_profile'

    get '/news', to: 'news#show'

    get '/venues/:lat/:lon', to: 'venues#show', constraints: { lat: /[^\/]*/, lon: /[^\/]*/ }
    get '/homeless/:device_id', to: 'venues#homeless'
    get '/charities', to: 'charities#show'

    get '/timeline', to: 'timeline#show'
    post '/timeline/voucher/:id', to: 'timeline#use_voucher'
    put '/timeline/verify_payment', to: 'timeline#verify_payment_and_show_voucher'

    resource :payments, only: [:create]

    scope 'general' do
      get '/users', to: 'general#get_mailchimp_users'
    end
  end

  get '/mobi/reservation-login', to: 'mobile#login'
  post '/mobi/reservation', to: 'mobile#signup'
  post '/mobi/reservation_confirm', to: 'mobile#callahead'
  get '/mobi/num_users', to: 'mobile#num_users'
  get '/notification', to: 'application#notification'

  # HighVoltage
  # get '/faq/:id', to: 'faq#show', as: 'faq'
  get '/faq', to: 'faq#show', as: 'faq', id: 'faq'
  get '/about_we', to: 'faq#about_we', as: 'about_we', id: 'about_we'

  # Popups
  get '/non_profit_on_grand_rapids', to: 'popups#non_profit_on_grand_rapids', as: :non_profit_on_grand_rapids_popup
  get '/postcard_popup', to: 'popups#postcard', as: :postcard_popup
  post '/notify_signup', to: 'popups#notify_signup'
  get '/app_popup', to: 'popups#app_popup'
  get '/:id', to: 'home#index', as: :venue_popup
  get '/deal_popup_not_logged/:id', to: 'popups#deal_popup_not_logged'
  get '/reciept/:id', to: 'popups#reciept'

  get '/download', to: 'application#download', as: :download

  get '/sms', to: 'receive_texts#index', via: :post

  get '/receive_text/used_code', to: 'receive_text#used_code'
  get '/receive_text/used_last', to: 'receive_text#used_last'

  get '/editor/:id', to: 'editor#show'

  get '/race', to: 'race#index'
  get '/cater', to: 'home#cater' # , as: :notgr
  get '/thanks', to: 'home#thanks' # , as: :notgr

  root to: 'home#index'
end
