wws-MacBook-Pro:food_circles ww$ rake routes
                  omniauth_email GET    /sessions/omniauth_email(.:format)        omniauth_ask_for_email#index
           omniauth_email_submit PUT    /sessions/omniauth_email(.:format)        omniauth_ask_for_email#submit
          reservation_used_email GET    /reservation/used_email(.:format)         reservation#used_email
                reservation_used GET    /reservation/used(.:format)               reservation#used
              reservation_active GET    /reservation/active(.:format)             reservation#active
             reservation_expired GET    /reservation/expired(.:format)            reservation#expired
                    payment_used GET    /payment/used(.:format)                   payment#used
                  payment_active GET    /payment/active(.:format)                 payment#active
                 payment_expired GET    /payment/expired(.:format)                payment#expired
       payment_inbound_mark_used GET    /payment/inbound_mark_used(.:format)      payment#inbound_mark_used
               payment_send_text GET    /payment/send_text(.:format)              payment#send_text
                          signup GET    /signup(.:format)                         signup#index
                                 POST   /signup(.:format)                         signup#create
                                 POST   /signup(.:format)                         signup#create
                           inbox POST   /inbox(.:format)                          inbox#create
                                 GET    /inbox(.:format)                          inbox#show
                        callback        /auth/:provider/callback(.:format)        sessions#create
         socialbutterflies_index GET    /socialbutterflies/index(.:format)        socialbutterflies#index
                          offers GET    /offers(.:format)                         offers#index
                                 POST   /offers(.:format)                         offers#create
                       new_offer GET    /offers/new(.:format)                     offers#new
                      edit_offer GET    /offers/:id/edit(.:format)                offers#edit
                           offer GET    /offers/:id(.:format)                     offers#show
                                 PUT    /offers/:id(.:format)                     offers#update
                                 DELETE /offers/:id(.:format)                     offers#destroy
                      categories GET    /categories(.:format)                     categories#index
                                 POST   /categories(.:format)                     categories#create
                    new_category GET    /categories/new(.:format)                 categories#new
                   edit_category GET    /categories/:id/edit(.:format)            categories#edit
                        category GET    /categories/:id(.:format)                 categories#show
                                 PUT    /categories/:id(.:format)                 categories#update
                                 DELETE /categories/:id(.:format)                 categories#destroy
                        timeline        /timeline(.:format)                       timeline#index
                          stripe        /payment/stripe(.:format)                 payment#stripe
              user_signup_create GET    /user_signup/create(.:format)             user_signup#create
                 stripe_payments POST   /stripe_payments(.:format)                stripe_payments#create
              new_stripe_payment GET    /stripe_payments/new(.:format)            stripe_payments#new
                         invoice        /monthly_invoice(.:format)                monthly_invoice#monthly_invoice
               venues_chat_index GET    /chat/venues(.:format)                    chat#venues
                      chat_index GET    /chat(.:format)                           chat#index
                            chat GET    /chat/:id(.:format)                       chat#show
               remind_list_index POST   /remind_list(.:format)                    remind_list#create
                 subscribe_venue POST   /venues/:id/subscribe(.:format)           venues#subscribe
               unsubscribe_venue POST   /venues/:id/unsubscribe(.:format)         venues#unsubscribe
                subscribed_venue GET    /venues/:id/subscribed(.:format)          venues#subscribed
                           venue GET    /venues/:id(.:format)                     venues#show
                     new_twitter GET    /registrations/new_twitter(.:format)      users/omniauth_callbacks#new_twitter
                  twitter_signup POST   /registrations/twitter_signup(.:format)   users/omniauth_callbacks#twitter_signup
                new_user_session GET    /users/sign_in(.:format)                  devise/sessions#new
                    user_session POST   /users/sign_in(.:format)                  devise/sessions#create
            destroy_user_session DELETE /users/sign_out(.:format)                 devise/sessions#destroy
         user_omniauth_authorize        /users/auth/:provider(.:format)           users/omniauth_callbacks#passthru {:provider=>/facebook|twitter/}
          user_omniauth_callback        /users/auth/:action/callback(.:format)    users/omniauth_callbacks#(?-mix:facebook|twitter)
                   user_password POST   /users/password(.:format)                 devise/passwords#create
               new_user_password GET    /users/password/new(.:format)             devise/passwords#new
              edit_user_password GET    /users/password/edit(.:format)            devise/passwords#edit
                                 PUT    /users/password(.:format)                 devise/passwords#update
        cancel_user_registration GET    /users/cancel(.:format)                   devise/registrations#cancel
               user_registration POST   /users(.:format)                          devise/registrations#create
           new_user_registration GET    /users/sign_up(.:format)                  devise/registrations#new
          edit_user_registration GET    /users/edit(.:format)                     devise/registrations#edit
                                 PUT    /users(.:format)                          devise/registrations#update
                                 DELETE /users(.:format)                          devise/registrations#destroy
           payment_notifications GET    /payment_notifications(.:format)          payment_notifications#index
                                 POST   /payment_notifications(.:format)          payment_notifications#create
        new_payment_notification GET    /payment_notifications/new(.:format)      payment_notifications#new
       edit_payment_notification GET    /payment_notifications/:id/edit(.:format) payment_notifications#edit
            payment_notification GET    /payment_notifications/:id(.:format)      payment_notifications#show
                                 PUT    /payment_notifications/:id(.:format)      payment_notifications#update
                                 DELETE /payment_notifications/:id(.:format)      payment_notifications#destroy
                    achievements        /achievements(.:format)                   achievements#index
        achievements_best_donors        /achievements/best_donors(.:format)       achievements#best_donors
                     rails_admin        /admin                                    RailsAdmin::Engine
               socialbutterflies GET    /socialbutterflies(.:format)              socialbutterflies#index
                                 POST   /socialbutterflies(.:format)              socialbutterflies#create
             new_socialbutterfly GET    /socialbutterflies/new(.:format)          socialbutterflies#new
            edit_socialbutterfly GET    /socialbutterflies/:id/edit(.:format)     socialbutterflies#edit
                 socialbutterfly GET    /socialbutterflies/:id(.:format)          socialbutterflies#show
                                 PUT    /socialbutterflies/:id(.:format)          socialbutterflies#update
                                 DELETE /socialbutterflies/:id(.:format)          socialbutterflies#destroy
                     restaurants GET    /restaurants(.:format)                    restaurants#index
                                 POST   /restaurants(.:format)                    restaurants#create
                  new_restaurant GET    /restaurants/new(.:format)                restaurants#new
                 edit_restaurant GET    /restaurants/:id/edit(.:format)           restaurants#edit
                      restaurant GET    /restaurants/:id(.:format)                restaurants#show
                                 PUT    /restaurants/:id(.:format)                restaurants#update
                                 DELETE /restaurants/:id(.:format)                restaurants#destroy
                       companies GET    /companies(.:format)                      companies#index
                                 POST   /companies(.:format)                      companies#create
                     new_company GET    /companies/new(.:format)                  companies#new
                    edit_company GET    /companies/:id/edit(.:format)             companies#edit
                         company GET    /companies/:id(.:format)                  companies#show
                                 PUT    /companies/:id(.:format)                  companies#update
                                 DELETE /companies/:id(.:format)                  companies#destroy
                      nonprofits GET    /nonprofits(.:format)                     nonprofits#index
                                 POST   /nonprofits(.:format)                     nonprofits#create
                   new_nonprofit GET    /nonprofits/new(.:format)                 nonprofits#new
                  edit_nonprofit GET    /nonprofits/:id/edit(.:format)            nonprofits#edit
                       nonprofit GET    /nonprofits/:id(.:format)                 nonprofits#show
                                 PUT    /nonprofits/:id(.:format)                 nonprofits#update
                                 DELETE /nonprofits/:id(.:format)                 nonprofits#destroy
                        students GET    /students(.:format)                       students#index
                                 POST   /students(.:format)                       students#create
                     new_student GET    /students/new(.:format)                   students#new
                    edit_student GET    /students/:id/edit(.:format)              students#edit
                         student GET    /students/:id(.:format)                   students#show
                                 PUT    /students/:id(.:format)                   students#update
                                 DELETE /students/:id(.:format)                   students#destroy
                      organizers GET    /organizers(.:format)                     organizers#index
                                 POST   /organizers(.:format)                     organizers#create
                   new_organizer GET    /organizers/new(.:format)                 organizers#new
                  edit_organizer GET    /organizers/:id/edit(.:format)            organizers#edit
                       organizer GET    /organizers/:id(.:format)                 organizers#show
                                 PUT    /organizers/:id(.:format)                 organizers#update
                                 DELETE /organizers/:id(.:format)                 organizers#destroy
                  nominate_index GET    /nominate(.:format)                       nominate#index
                                 POST   /nominate(.:format)                       nominate#create
                    new_nominate GET    /nominate/new(.:format)                   nominate#new
                   edit_nominate GET    /nominate/:id/edit(.:format)              nominate#edit
                        nominate GET    /nominate/:id(.:format)                   nominate#show
                                 PUT    /nominate/:id(.:format)                   nominate#update
                                 DELETE /nominate/:id(.:format)                   nominate#destroy
                        payments GET    /mobi/payments(.:format)                  payments#index
                                 POST   /mobi/payments(.:format)                  payments#create
                     new_payment GET    /mobi/payments/new(.:format)              payments#new
                    edit_payment GET    /mobi/payments/:id/edit(.:format)         payments#edit
                         payment GET    /mobi/payments/:id(.:format)              payments#show
                                 PUT    /mobi/payments/:id(.:format)              payments#update
                                 DELETE /mobi/payments/:id(.:format)              payments#destroy
            credit_card_settings DELETE /settings/credit_card(.:format)           settings#credit_card
        update_password_settings PUT    /settings/update_password(.:format)       settings#update_password
    facebook_connection_settings DELETE /settings/facebook_connection(.:format)   settings#facebook_connection
     twitter_connection_settings DELETE /settings/twitter_connection(.:format)    settings#twitter_connection
                        settings GET    /settings(.:format)                       settings#show
                                 PUT    /settings(.:format)                       settings#update
            subscribe_newsletter POST   /newsletter/subscribe(.:format)           newsletters#subscribe
                       postcards POST   /postcards(.:format)                      postcards#create
                             app        /app(.:format)                            app#index
                        getVenue        /getVenue(.:format)                       app#getVenue
                       getVenues        /getVenues(.:format)                      app#getVenues
                    getCharities        /getCharities(.:format)                   app#getCharities
                         confirm        /confirm(.:format)                        app#confirm
                          submit        /submit(.:format)                         app#submit
                       user_info        /newinfo(.:format)                        app#newinfo
                  create_voucher        /create_voucher(.:format)                 app#create_voucher
                         voucher        /voucher(.:format)                        app#voucher
                api_weekly_meals GET    /api/weekly_meals(.:format)               api/weekly_meals#show
            api_sessions_sign_in POST   /api/sessions/sign_in(.:format)           api/sessions#sign_in
            api_sessions_sign_up POST   /api/sessions/sign_up(.:format)           api/sessions#sign_up
             api_sessions_update PUT    /api/sessions/update(.:format)            api/sessions#update_profile
                        api_news GET    /api/news(.:format)                       api/news#show
                             api GET    /api/venues/:lat/:lon(.:format)           api/venues#show {:lat=>/[^\/]*/, :lon=>/[^\/]*/}
                                 GET    /api/homeless/:device_id(.:format)        api/venues#homeless
                   api_charities GET    /api/charities(.:format)                  api/charities#show
                    api_timeline GET    /api/timeline(.:format)                   api/timeline#show
                                 POST   /api/timeline/voucher/:id(.:format)       api/timeline#use_voucher
     api_timeline_verify_payment PUT    /api/timeline/verify_payment(.:format)    api/timeline#verify_payment_and_show_voucher
                    api_payments POST   /api/payments(.:format)                   api/payments#create
                       api_users GET    /api/general/users(.:format)              api/general#get_mailchimp_users
                                        /mobi/reservation-login(.:format)         mobile#login
                mobi_reservation        /mobi/reservation(.:format)               mobile#signup
        mobi_reservation_confirm        /mobi/reservation_confirm(.:format)       mobile#callahead
                  mobi_num_users        /mobi/num_users(.:format)                 mobile#num_users
                    notification        /notification(.:format)                   application#notification
                             faq GET    /faq/:id(.:format)                        faq#show
                             faq GET    /faq(.:format)                            faq#show {:id=>"faq"}
                        about_we GET    /about_we(.:format)                       faq#show {:id=>"about_we"}
non_profit_on_grand_rapids_popup        /non_profit_on_grand_rapids(.:format)     popups#non_profit_on_grand_rapids
                  postcard_popup        /postcard_popup(.:format)                 popups#postcard
                   notify_signup        /notify_signup(.:format)                  popups#notify_signup
                       app_popup        /app_popup(.:format)                      popups#app_popup
                     venue_popup        /:id(.:format)                            home#index
                                        /deal_popup_not_logged/:id(.:format)      popups#deal_popup_not_logged
                                        /reciept/:id(.:format)                    popups#reciept
                        download        /download(.:format)                       application#download
                             sms POST   /sms(.:format)                            receive_texts#index
          receive_text_used_code        /receive_text/used_code(.:format)         receive_text#used_code
          receive_text_used_last        /receive_text/used_last(.:format)         receive_text#used_last
                                        /editor/:id(.:format)                     editor#show
                            race        /race(.:format)                           race#index
                           notgr        /cater(.:format)                          home#cater
                           notgr        /thanks(.:format)                         home#thanks
                            root        /                                         home#index
                  omniauth_email GET    /sessions/omniauth_email(.:format)        omniauth_ask_for_email#index
           omniauth_email_submit PUT    /sessions/omniauth_email(.:format)        omniauth_ask_for_email#submit
                                 GET    /reservation/used_email(.:format)         reservation#used_email
                                 GET    /reservation/used(.:format)               reservation#used
                                 GET    /reservation/active(.:format)             reservation#active
                                 GET    /reservation/expired(.:format)            reservation#expired
                                 GET    /payment/used(.:format)                   payment#used
                                 GET    /payment/active(.:format)                 payment#active
                                 GET    /payment/expired(.:format)                payment#expired
                                 GET    /payment/inbound_mark_used(.:format)      payment#inbound_mark_used
               payment_send_text GET    /payment/send_text(.:format)              payment#send_text
                          signup GET    /signup(.:format)                         signup#index
                                 POST   /signup(.:format)                         signup#create
                                 POST   /signup(.:format)                         signup#create
                                 POST   /inbox(.:format)                          inbox#create
                                 GET    /inbox(.:format)                          inbox#show
                        callback        /auth/:provider/callback(.:format)        sessions#create
                                 GET    /socialbutterflies/index(.:format)        socialbutterflies#index
                                 GET    /offers(.:format)                         offers#index
                                 POST   /offers(.:format)                         offers#create
                                 GET    /offers/new(.:format)                     offers#new
                                 GET    /offers/:id/edit(.:format)                offers#edit
                                 GET    /offers/:id(.:format)                     offers#show
                                 PUT    /offers/:id(.:format)                     offers#update
                                 DELETE /offers/:id(.:format)                     offers#destroy
                                 GET    /categories(.:format)                     categories#index
                                 POST   /categories(.:format)                     categories#create
                                 GET    /categories/new(.:format)                 categories#new
                                 GET    /categories/:id/edit(.:format)            categories#edit
                                 GET    /categories/:id(.:format)                 categories#show
                                 PUT    /categories/:id(.:format)                 categories#update
                                 DELETE /categories/:id(.:format)                 categories#destroy
                        timeline        /timeline(.:format)                       timeline#index
                          stripe        /payment/stripe(.:format)                 payment#stripe
                                 GET    /user_signup/create(.:format)             user_signup#create
                                 POST   /stripe_payments(.:format)                stripe_payments#create
                                 GET    /stripe_payments/new(.:format)            stripe_payments#new
                         invoice        /monthly_invoice(.:format)                monthly_invoice#monthly_invoice
                                 GET    /chat/venues(.:format)                    chat#venues
                                 GET    /chat(.:format)                           chat#index
                                 GET    /chat/:id(.:format)                       chat#show
                                 POST   /remind_list(.:format)                    remind_list#create
                                 POST   /venues/:id/subscribe(.:format)           venues#subscribe
                                 POST   /venues/:id/unsubscribe(.:format)         venues#unsubscribe
                                 GET    /venues/:id/subscribed(.:format)          venues#subscribed
                                 GET    /venues/:id(.:format)                     venues#show
                     new_twitter GET    /registrations/new_twitter(.:format)      users/omniauth_callbacks#new_twitter
                  twitter_signup POST   /registrations/twitter_signup(.:format)   users/omniauth_callbacks#twitter_signup
                new_user_session GET    /users/sign_in(.:format)                  devise/sessions#new
                                 POST   /users/sign_in(.:format)                  devise/sessions#create
            destroy_user_session DELETE /users/sign_out(.:format)                 devise/sessions#destroy
         user_omniauth_authorize        /users/auth/:provider(.:format)           users/omniauth_callbacks#passthru {:provider=>/facebook|twitter/}
          user_omniauth_callback        /users/auth/:action/callback(.:format)    users/omniauth_callbacks#(?-mix:facebook|twitter)
                                 POST   /users/password(.:format)                 devise/passwords#create
                                 GET    /users/password/new(.:format)             devise/passwords#new
                                 GET    /users/password/edit(.:format)            devise/passwords#edit
                                 PUT    /users/password(.:format)                 devise/passwords#update
                                 GET    /users/cancel(.:format)                   devise/registrations#cancel
                                 POST   /users(.:format)                          devise/registrations#create
                                 GET    /users/sign_up(.:format)                  devise/registrations#new
                                 GET    /users/edit(.:format)                     devise/registrations#edit
                                 PUT    /users(.:format)                          devise/registrations#update
                                 DELETE /users(.:format)                          devise/registrations#destroy
                                 GET    /payment_notifications(.:format)          payment_notifications#index
                                 POST   /payment_notifications(.:format)          payment_notifications#create
                                 GET    /payment_notifications/new(.:format)      payment_notifications#new
                                 GET    /payment_notifications/:id/edit(.:format) payment_notifications#edit
                                 GET    /payment_notifications/:id(.:format)      payment_notifications#show
                                 PUT    /payment_notifications/:id(.:format)      payment_notifications#update
                                 DELETE /payment_notifications/:id(.:format)      payment_notifications#destroy
                    achievements        /achievements(.:format)                   achievements#index
        achievements_best_donors        /achievements/best_donors(.:format)       achievements#best_donors
                     rails_admin        /admin                                    RailsAdmin::Engine
                                 GET    /socialbutterflies(.:format)              socialbutterflies#index
                                 POST   /socialbutterflies(.:format)              socialbutterflies#create
                                 GET    /socialbutterflies/new(.:format)          socialbutterflies#new
                                 GET    /socialbutterflies/:id/edit(.:format)     socialbutterflies#edit
                                 GET    /socialbutterflies/:id(.:format)          socialbutterflies#show
                                 PUT    /socialbutterflies/:id(.:format)          socialbutterflies#update
                                 DELETE /socialbutterflies/:id(.:format)          socialbutterflies#destroy
                                 GET    /restaurants(.:format)                    restaurants#index
                                 POST   /restaurants(.:format)                    restaurants#create
                                 GET    /restaurants/new(.:format)                restaurants#new
                                 GET    /restaurants/:id/edit(.:format)           restaurants#edit
                                 GET    /restaurants/:id(.:format)                restaurants#show
                                 PUT    /restaurants/:id(.:format)                restaurants#update
                                 DELETE /restaurants/:id(.:format)                restaurants#destroy
                                 GET    /companies(.:format)                      companies#index
                                 POST   /companies(.:format)                      companies#create
                                 GET    /companies/new(.:format)                  companies#new
                                 GET    /companies/:id/edit(.:format)             companies#edit
                                 GET    /companies/:id(.:format)                  companies#show
                                 PUT    /companies/:id(.:format)                  companies#update
                                 DELETE /companies/:id(.:format)                  companies#destroy
                                 GET    /nonprofits(.:format)                     nonprofits#index
                                 POST   /nonprofits(.:format)                     nonprofits#create
                                 GET    /nonprofits/new(.:format)                 nonprofits#new
                                 GET    /nonprofits/:id/edit(.:format)            nonprofits#edit
                                 GET    /nonprofits/:id(.:format)                 nonprofits#show
                                 PUT    /nonprofits/:id(.:format)                 nonprofits#update
                                 DELETE /nonprofits/:id(.:format)                 nonprofits#destroy
                                 GET    /students(.:format)                       students#index
                                 POST   /students(.:format)                       students#create
                                 GET    /students/new(.:format)                   students#new
                                 GET    /students/:id/edit(.:format)              students#edit
                                 GET    /students/:id(.:format)                   students#show
                                 PUT    /students/:id(.:format)                   students#update
                                 DELETE /students/:id(.:format)                   students#destroy
                                 GET    /organizers(.:format)                     organizers#index
                                 POST   /organizers(.:format)                     organizers#create
                                 GET    /organizers/new(.:format)                 organizers#new
                                 GET    /organizers/:id/edit(.:format)            organizers#edit
                                 GET    /organizers/:id(.:format)                 organizers#show
                                 PUT    /organizers/:id(.:format)                 organizers#update
                                 DELETE /organizers/:id(.:format)                 organizers#destroy
                                 GET    /nominate(.:format)                       nominate#index
                                 POST   /nominate(.:format)                       nominate#create
                                 GET    /nominate/new(.:format)                   nominate#new
                                 GET    /nominate/:id/edit(.:format)              nominate#edit
                                 GET    /nominate/:id(.:format)                   nominate#show
                                 PUT    /nominate/:id(.:format)                   nominate#update
                                 DELETE /nominate/:id(.:format)                   nominate#destroy
                                 GET    /mobi/payments(.:format)                  payments#index
                                 POST   /mobi/payments(.:format)                  payments#create
                                 GET    /mobi/payments/new(.:format)              payments#new
                                 GET    /mobi/payments/:id/edit(.:format)         payments#edit
                                 GET    /mobi/payments/:id(.:format)              payments#show
                                 PUT    /mobi/payments/:id(.:format)              payments#update
                                 DELETE /mobi/payments/:id(.:format)              payments#destroy
                                 DELETE /settings/credit_card(.:format)           settings#credit_card
                                 PUT    /settings/update_password(.:format)       settings#update_password
                                 DELETE /settings/facebook_connection(.:format)   settings#facebook_connection
                                 DELETE /settings/twitter_connection(.:format)    settings#twitter_connection
                                 GET    /settings(.:format)                       settings#show
                                 PUT    /settings(.:format)                       settings#update
                                 POST   /newsletter/subscribe(.:format)           newsletters#subscribe
                                 POST   /postcards(.:format)                      postcards#create
                                        /app(.:format)                            app#index
                                        /getVenue(.:format)                       app#getVenue
                                        /getVenues(.:format)                      app#getVenues
                                        /getCharities(.:format)                   app#getCharities
                                        /confirm(.:format)                        app#confirm
                                        /submit(.:format)                         app#submit
                       user_info        /newinfo(.:format)                        app#newinfo
                                        /create_voucher(.:format)                 app#create_voucher
                                        /voucher(.:format)                        app#voucher
                api_weekly_meals GET    /api/weekly_meals(.:format)               api/weekly_meals#show
                                 POST   /api/sessions/sign_in(.:format)           api/sessions#sign_in
                                 POST   /api/sessions/sign_up(.:format)           api/sessions#sign_up
                                 PUT    /api/sessions/update(.:format)            api/sessions#update_profile
                                 GET    /api/news(.:format)                       api/news#show
                                 GET    /api/venues/:lat/:lon(.:format)           api/venues#show {:lat=>/[^\/]*/, :lon=>/[^\/]*/}
                                 GET    /api/homeless/:device_id(.:format)        api/venues#homeless
                                 GET    /api/charities(.:format)                  api/charities#show
                                 GET    /api/timeline(.:format)                   api/timeline#show
                                 POST   /api/timeline/voucher/:id(.:format)       api/timeline#use_voucher
                                 PUT    /api/timeline/verify_payment(.:format)    api/timeline#verify_payment_and_show_voucher
                                 POST   /api/payments(.:format)                   api/payments#create
                                 GET    /api/general/users(.:format)              api/general#get_mailchimp_users
                                        /mobi/reservation-login(.:format)         mobile#login
                                        /mobi/reservation(.:format)               mobile#signup
                                        /mobi/reservation_confirm(.:format)       mobile#callahead
                                        /mobi/num_users(.:format)                 mobile#num_users
                                        /notification(.:format)                   application#notification
                             faq GET    /faq/:id(.:format)                        faq#show
                             faq GET    /faq(.:format)                            faq#show {:id=>"faq"}
                        about_we GET    /about_we(.:format)                       faq#show {:id=>"about_we"}
non_profit_on_grand_rapids_popup        /non_profit_on_grand_rapids(.:format)     popups#non_profit_on_grand_rapids
                  postcard_popup        /postcard_popup(.:format)                 popups#postcard
                                        /notify_signup(.:format)                  popups#notify_signup
                                        /app_popup(.:format)                      popups#app_popup
                     venue_popup        /:id(.:format)                            home#index
                                        /deal_popup_not_logged/:id(.:format)      popups#deal_popup_not_logged
                                        /reciept/:id(.:format)                    popups#reciept
                        download        /download(.:format)                       application#download
                                 POST   /sms(.:format)                            receive_texts#index
                                        /receive_text/used_code(.:format)         receive_text#used_code
                                        /receive_text/used_last(.:format)         receive_text#used_last
                                        /editor/:id(.:format)                     editor#show
                                        /race(.:format)                           race#index
                           notgr        /cater(.:format)                          home#cater
                           notgr        /thanks(.:format)                         home#thanks
                            root        /                                         home#index
                            page GET    /faq/*id                                  high_voltage/pages#show

Routes for RailsAdmin::Engine:
    dashboard GET         /                                      rails_admin/main#dashboard
        index GET|POST    /:model_name(.:format)                 rails_admin/main#index
          new GET|POST    /:model_name/new(.:format)             rails_admin/main#new
       export GET|POST    /:model_name/export(.:format)          rails_admin/main#export
  bulk_delete POST|DELETE /:model_name/bulk_delete(.:format)     rails_admin/main#bulk_delete
history_index GET         /:model_name/history(.:format)         rails_admin/main#history_index
  bulk_action POST        /:model_name/bulk_action(.:format)     rails_admin/main#bulk_action
         show GET         /:model_name/:id(.:format)             rails_admin/main#show
         edit GET|PUT     /:model_name/:id/edit(.:format)        rails_admin/main#edit
       delete GET|DELETE  /:model_name/:id/delete(.:format)      rails_admin/main#delete
 history_show GET         /:model_name/:id/history(.:format)     rails_admin/main#history_show
  show_in_app GET         /:model_name/:id/show_in_app(.:format) rails_admin/main#show_in_app
