Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/sessions/omniauth_email' => 'omniauth_ask_for_email#index', :as => 'omniauth_email'
  put '/sessions/omniauth_email' => 'omniauth_ask_for_email#submit', :as => 'omniauth_email_submit'

  get 'reservation/used_email' => 'reservation#used_email'
  get 'reservation/used' => 'reservation#used'
  get 'reservation/active' => 'reservation#active'
  get 'reservation/expired' => 'reservation#expired'

  get 'payment/used' => 'payment#used'
  get 'payment/active' => 'payment#active'
  get 'payment/expired' => 'payment#expired'
  get 'payment/inbound_mark_used' => 'payment#inbound_mark_used'
  get 'payment/send_text' => 'payment#send_text', :as => 'payment_send_text'

  get 'signup' => 'signup#index', as: 'signup'
  post 'signup' => 'signup#create'
  resource :signup, controller: 'signup', only: [:index, :create]

  resource :inbox, controller: 'inbox', only: [:show, :create]

  get '/auth/:provider/callback', to: 'sessions#create', as: 'callback'

  get 'socialbutterflies/index'

  # match '/offers' => 'offers#index', :as => :offers
  resources :offers
  resources :categories
  get '/timeline' => 'timeline#index', :as => :timeline
  # match '/payment' => 'payment#index', :as => :payment
  post '/payment/stripe' => 'payment#stripe', :as => :stripe

  get 'user_signup/create'

  resources :stripe_payments, only: [:new, :create]

  get '/monthly_invoice' => 'monthly_invoice#monthly_invoice', :as => :invoice

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
    get '/registrations/new_twitter' => 'users/omniauth_callbacks#new_twitter', :as => 'new_twitter'
    post '/registrations/twitter_signup' => 'users/omniauth_callbacks#twitter_signup', :as => 'twitter_signup'
  end

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  resources :payment_notifications

  get '/achievements' => 'achievements#index', :as => :achievements
  get '/achievements/best_donors' => 'achievements#best_donors', :as => :achievements_best_donors

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

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

  get '/app' => 'app#index'
  get '/getVenue' => 'app#getVenue'
  get '/getVenues' => 'app#getVenues'
  get '/getCharities' => 'app#getCharities'
  post '/confirm' => 'app#confirm'
  post '/submit' => 'app#submit'
  get '/newinfo' => 'app#newinfo', :as => :user_info
  get '/create_voucher' => 'app#create_voucher'
  get '/voucher' => 'app#voucher'

  # API

  namespace :api do
    get '/weekly_meals' => 'weekly_meals#show', as: 'weekly_meals'

    post '/sessions/sign_in' => 'sessions#sign_in'
    post '/sessions/sign_up' => 'sessions#sign_up'

    put '/sessions/update' => 'sessions#update_profile'

    get '/news' => 'news#show'

    get '/venues/:lat/:lon' => 'venues#show', :constraints => { lat: /[^\/]*/, lon: /[^\/]*/ }
    get '/homeless/:device_id' => 'venues#homeless'
    get '/charities' => 'charities#show'

    get '/timeline' => 'timeline#show'
    post '/timeline/voucher/:id' => 'timeline#use_voucher'
    put '/timeline/verify_payment' => 'timeline#verify_payment_and_show_voucher'

    resource :payments, only: [:create]

    scope 'general' do
      get '/users' => 'general#get_mailchimp_users'
    end
  end

  get '/mobi/reservation-login' => 'mobile#login'
  post '/mobi/reservation' => 'mobile#signup'
  post '/mobi/reservation_confirm' => 'mobile#callahead'
  get '/mobi/num_users' => 'mobile#num_users'
  get '/notification' => 'application#notification'

  # HighVoltage
  #get '/faq/:id' => 'faq#show', :as => 'faq'
  get '/faq' => 'faq#show', :as => 'faq', :id => 'faq'
  get '/about_we' => 'faq#show', :as => 'about_we', :id => 'about_we'

  # Popups
  get '/non_profit_on_grand_rapids' => 'popups#non_profit_on_grand_rapids', :as => :non_profit_on_grand_rapids_popup
  get '/postcard_popup' => 'popups#postcard', :as => :postcard_popup
  post '/notify_signup' => 'popups#notify_signup'
  get '/app_popup' => 'popups#app_popup'
  get '/:id' => 'home#index', :as => :venue_popup
  get '/deal_popup_not_logged/:id' => 'popups#deal_popup_not_logged'
  get '/reciept/:id' => 'popups#reciept'

  get '/download' => 'application#download', :as => :download

  get '/sms' => 'receive_texts#index', :via => :post

  get '/receive_text/used_code' => 'receive_text#used_code'
  get '/receive_text/used_last' => 'receive_text#used_last'

  get '/editor/:id' => 'editor#show'

  get '/race' => 'race#index'
  get '/cater' => 'home#cater' # , :as => :notgr
  get '/thanks' => 'home#thanks' # , :as => :notgr

  root to: 'home#index'
end
