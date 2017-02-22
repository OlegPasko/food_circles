# frozen_string_literal: true
class PaymentNotificationsController < ApplicationController

  def create
    @payment_notification = PaymentNotification.new(params[:payment_notification])

    # PaymentNotification.create!()

    PaymentNotification.create!(payment_notification_params)

    render nothing: true
  end

  private

  def payment_notification_params
    params.require(:payment_notification).permit(:parameters, :paypal_id, :status,
                                                 :transaction_id, :address_city, :address_country,
                                                 :address_name, :address_state, :address_street, :address_zip,
                                                 :first_name, :invoice, :last_name, :mc_currency, :mc_gross,
                                                 :payer_email, :payer_status, :payment_date, :payment_type,
                                                 :txn_id, :verify_sign, :user_id)
  end
end
