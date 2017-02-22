# frozen_string_literal: true
Devise::SessionsController.class_eval do
  after_action :after_signin, only: :create

  def after_signin
    enqueue_mix_panel_event 'Sign In'
  end
end
