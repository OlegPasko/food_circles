class SocialLink < ApplicationRecord
  belongs_to :venue

  def as_json(options = {})
    super(options.merge(only: :url, methods: [:source]))
  end

  def source
    case url
    when /www\.yelp\.(.+)/
      "yelp"
    when /www\.twitter\.(.+)/
      "twitter"
    else
      "facebook"
    end
  end
end
