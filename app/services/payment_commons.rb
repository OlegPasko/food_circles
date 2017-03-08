# frozen_string_literal: true
module PaymentCommons
  def get_friends_purchases
    @friends_payments = []
    return unless current_user.twitter_token && current_user.twitter_secret
    begin
      require 'twitter'
      client = Twitter::Client.new(oauth_token: current_user.twitter_token, oauth_token_secret: current_user.twitter_secret)

      user_ids = client.friends.map(&:id)
      logger.debug "UIDS: #{user_ids}"
      user_ids.each do |uid|
        u = User.find_by_twitter_uid(uid.to_s)
        logger.debug "User: #{u}"
        next if u.nil?
        unless u.twitter_uid.nil?
          current_user.friends << u.id unless u == current_user
        end
      end
      current_user.friends = current_user.friends.distinct
      current_user.save

      current_user.friends.each do |u|
        @friends_payments << User.find(u).payments
      end
      @friends_payments.flatten.distinct
    rescue Twitter::Error::TooManyRequests => e
      logger.debug 'HIT THE RATE LIMIT'
    rescue Twitter::Error::Forbidden => e
      logger.debug 'WRONG TWITTER CREDS'
    end
  end

  def load_reservations
    @reservations = current_user.reservations.order('created_at DESC')
  end

  def load_payments
    @payments = current_user.payments.order('created_at DESC').joins(:offer).distinct

  def load_weekly_total
    @weekly_total = current_user.payments.where('created_at > ?', Time.now - 1.week).collect(&:amount).sum
  end
end
