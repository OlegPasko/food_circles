# frozen_string_literal: true
class RemindListController < ApplicationController
  require 'resolv'

  def create
    @reminder = RemindList.create(blah: params[:blah])
    email = @reminder.blah

    unless email.blank?
      if email =~ /^[a-zA-Z][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/
        if validate_email_domain(email)
          UserMailer.food_mail(email).deliver
        else
          sendText(email)
        end
      else
        errors.add(:email, 'Your email address does not appear to be valid')
      end
    end
    render nothing: true
  end

  def validate_email_domain(email)
    domain = email.match(/\@(.+)/)[1]
    Resolv::DNS.open do |dns|
      @mx = dns.getresources(domain, Resolv::DNS::Resource::IN::MX)
    end
    !@mx.empty? ? true : false
  end
end
